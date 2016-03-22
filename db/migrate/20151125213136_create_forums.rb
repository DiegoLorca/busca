class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :slogan
      t.text :presentacion
      t.string :hora
      t.integer :visits_count

      t.timestamps
    end
  end
end
