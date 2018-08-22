class ChangeAttributesOfDucks < ActiveRecord::Migration[5.2]
  def change
    remove_column :ducks, :postal_code, :string
    remove_column :ducks, :city, :string
    remove_column :ducks, :country, :string
    rename_column :ducks, :lat, :latitude
    rename_column :ducks, :lng, :longitude
  end
end
