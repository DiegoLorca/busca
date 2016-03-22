class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.date :published_on
      t.text :content
      t.integer :conteo_visitas

      t.timestamps null: false
    end
  end
end
