class CreateRestOwners < ActiveRecord::Migration
  def change
    create_table :rest_owners do |t|

      t.timestamps null: false
    end
  end
end
