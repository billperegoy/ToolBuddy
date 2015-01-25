class Installation < ActiveRecord::Base
  belongs_to :site
  belongs_to :version
end
