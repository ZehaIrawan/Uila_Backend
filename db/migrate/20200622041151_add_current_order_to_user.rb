class AddCurrentOrderToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_order, :integer, null: true, default: nil
  end
end
