class AddLocationToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :latitude, :float
    add_column :microposts, :longitude, :float
  end
end
