class AddCityToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :address, :string
  end
end
