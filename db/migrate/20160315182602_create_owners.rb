class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :username
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
