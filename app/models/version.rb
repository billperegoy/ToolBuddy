class Version < ActiveRecord::Base
  belongs_to :tool
  has_many :installations

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\Av\d+\.\d+\.\d+\z/,
                             message: "must be of format v<num>.<num>.<num>" }

  validates :release_notes, presence: true
  validates :release_notes, length: {minimum: 24} 

  after_save :create_empty_installations, on: [ :create ]

  protected
  def create_empty_installations
    Site.all.each do |site|
      Installation.create(state: 'uninstalled' , version_id: self.id , site_id: site.id)
    end
  end
end
