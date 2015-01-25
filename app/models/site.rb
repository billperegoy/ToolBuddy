class Site < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :install_host, presence: true
  validates :install_path, presence: true

  after_save :create_empty_installations, on: [ :create ]

  protected
  def create_empty_installations
    Version.all.each do |version|
      Installation.create(state: 'uninstalled' , version_id: version.id , site_id: self.id)
    end
  end
end
