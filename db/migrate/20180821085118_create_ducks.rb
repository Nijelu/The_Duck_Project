class CreateDucks < ActiveRecord::Migration[5.2]
  def change
    create_table :ducks do |t|
      t.string :title
      t.text :description
      t.integer :price_per_day
      t.string :photo
      t.string :address
      t.float :lat
      t.float :lng
      t.string :country
      t.string :city
      t.string :postal_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
