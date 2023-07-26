class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.date :fecha
      t.string :usuario
      t.string :numero
      t.integer :operacion
      t.integer :saldo_inicial
      t.integer :saldo_final

      t.timestamps
    end
  end
end
