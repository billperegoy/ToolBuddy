class Version < ActiveRecord::Base
  belongs_to :tool
  has_many :installations
  after_save :create_empty_installations, on: [ :create ]

  protected
  def create_empty_installations
    Site.all.each do |site|
      Installation.create(state: 'uninstalled' , version_id: self.id , site_id: site.id)
    end
  end
end
