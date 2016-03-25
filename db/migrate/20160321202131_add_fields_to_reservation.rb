class AddFieldsToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :time, :datetime
    add_column :reservations, :user_id, :integer
    add_column :reservations, :rest_id, :integer
    add_column :reservations, :name, :string
  end
end
