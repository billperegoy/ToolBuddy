class Site < ActiveRecord::Base
  after_save :create_empty_installations, on: [ :create ]

  protected
  def create_empty_installations
    Version.all.each do |version|
      Installation.create(state: 'uninstalled' , version_id: version.id , site_id: self.id)
    end
  end
end
