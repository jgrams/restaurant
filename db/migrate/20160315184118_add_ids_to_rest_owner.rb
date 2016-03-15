class AddIdsToRestOwner < ActiveRecord::Migration
  def change
    add_column :rest_owners, :rest_id, :integer
    add_column :rest_owners, :owner_id, :integer
  end
end
