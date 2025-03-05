class CreateTorneios < ActiveRecord::Migration[8.0]
  def change
    create_table :torneios do |t|
      t.string :nome
      t.text :descricao
      t.datetime :data_inicio
      t.datetime :data_fim
      t.string :status

      t.timestamps
    end
  end
end
