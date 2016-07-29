class Review < ActiveRecord::Base
  belongs_to :user   # let's just call this one the writer
  has_one :user      # and let's just call this one the reviewed
end
