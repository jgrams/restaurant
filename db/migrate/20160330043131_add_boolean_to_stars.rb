class AddBooleanToStars < ActiveRecord::Migration
  def change
    add_column :stars, :starred, :boolean
  end
end
