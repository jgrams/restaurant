class CreateRests < ActiveRecord::Migration
  def change
    create_table :rests do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :owner
      t.string :phone

      t.timestamps null: false
    end
  end
end
