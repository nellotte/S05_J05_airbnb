class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.datetime :check_in
      t.datetime :check_out

     
      t.timestamps
    end
  end
end
