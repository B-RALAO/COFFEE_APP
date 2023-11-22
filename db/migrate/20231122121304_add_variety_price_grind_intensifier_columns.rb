class AddVarietyPriceGrindIntensifierColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :coffees, :variety, :string
    add_column :coffees, :price, :decimal
    add_column :coffees, :grind, :string
    add_column :coffees, :intensifier, :string
  end
end
