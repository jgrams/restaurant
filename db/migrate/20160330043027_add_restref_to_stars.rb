class AddRestrefToStars < ActiveRecord::Migration
  def change
    add_reference :stars, :rest, index: true, foreign_key: true
  end
end
