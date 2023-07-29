class AddQuantityToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :quantity, :integer, default: 0
  end
end
