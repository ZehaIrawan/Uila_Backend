class AddCurrentCartToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_cart, :integer, null: true, default: nil
  end
end
