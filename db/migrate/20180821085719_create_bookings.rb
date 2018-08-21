class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.text :tenant_review
      t.text :owner_review
      t.string :status
      t.references :duck, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
