class RemoveColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :fecha, :datetime
    remove_column :users, :operacion, :integer
    remove_column :users, :saldo_inicial, :integer
    remove_column :users, :saldo_final, :integer
  end
end
