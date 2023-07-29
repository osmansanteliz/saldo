class AddPurchaseDateToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :purchase_date, :date
  end
end
