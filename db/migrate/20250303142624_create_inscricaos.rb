class CreateInscricaos < ActiveRecord::Migration[8.0]
  def change
    create_table :inscricaos do |t|
      t.integer :torneio_id
      t.integer :usuario_id
      t.datetime :data_hora

      t.timestamps
    end
  end
end
