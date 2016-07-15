class CreateRequest < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.decimal :height
      t.decimal :width
      t.text :details
    end
  end
end
