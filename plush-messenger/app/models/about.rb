class About < ActiveRecord::Base
  serialize :links
  belongs_to :user
end
