class CreateInscricoes < ActiveRecord::Migration[8.0]
  def change
    create_table :inscricoes do |t|
      t.integer :torneio_id
      t.integer :usuario_id
      t.datetime :data_hora

      t.timestamps
    end
  end
end