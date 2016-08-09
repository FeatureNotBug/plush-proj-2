class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  acts_as_messageable
  ratyrate_rateable 'as_buyer', 'as_seller'
  ratyrate_rater

  has_one :about
  has_many :reviews_about_me, foreign_key: "user_id", class_name: "Review"
  has_many :reviews_by_me, foreign_key: "reviewer_id", class_name: "Review"

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
