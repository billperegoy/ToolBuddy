class Tool < ActiveRecord::Base
  has_many :versions

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :repository_path, presence: true
end
