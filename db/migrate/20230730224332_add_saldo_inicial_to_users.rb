class AddSaldoInicialToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :saldo_inicial, :integer, default: 0
  end
end
