class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.integer :user_id
      t.integer :reviewer_id
    end
  end
end
