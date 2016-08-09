class Review < ActiveRecord::Base
  belongs_to :user                          
  has_one :reviewer, :class_name => 'User', :foreign_key => 'reviewer_id' 

  def new
  end
end
