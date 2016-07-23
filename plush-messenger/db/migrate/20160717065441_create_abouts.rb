class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :aboutme
      t.text :links, array: true, default: []
      t.integer :user_id
    end
  end
end
