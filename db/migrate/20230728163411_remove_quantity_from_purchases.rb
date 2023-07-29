class RemoveQuantityFromPurchases < ActiveRecord::Migration[7.0]
  def change
    remove_column :purchases, :quantity, :integer, default: 0
  end
end
