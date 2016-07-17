class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :aboutme
      t.text :links
    end
  end
end
