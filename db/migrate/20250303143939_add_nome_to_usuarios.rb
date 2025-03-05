class AddNomeToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :nome, :string
  end
end
