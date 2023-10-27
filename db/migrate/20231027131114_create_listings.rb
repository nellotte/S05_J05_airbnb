class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      
      t.string :title
      t.text :description
      t.integer :price
      t.integer :available_beds
      t.text :welcome_message
      t.boolean :has_wifi

      t.timestamps
    end
  end 
end
