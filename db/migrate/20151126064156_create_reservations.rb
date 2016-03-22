class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :forum, index: true
      t.date :fechaclase
      t.time :horaclase

      t.timestamps
    end
  end
end
