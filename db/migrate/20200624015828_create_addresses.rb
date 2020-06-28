class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :full_name
      t.string :addressline1
      t.string :addressline2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :phone

      t.timestamps
    end
  end
end
