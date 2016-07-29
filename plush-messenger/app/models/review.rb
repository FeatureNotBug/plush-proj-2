class Review < ActiveRecord::Base
  belongs_to :user                          # let's just call this one the writer
  has_one :reviewer, :class_name => 'User', :foreign_key => 'reviewer_id'  # and let's just call this one the reviewed
end
