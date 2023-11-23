class AddCoordinatesToCoffees < ActiveRecord::Migration[7.1]
  def change
    add_column :coffees, :latitude, :float
    add_column :coffees, :longitude, :float
  end
end
