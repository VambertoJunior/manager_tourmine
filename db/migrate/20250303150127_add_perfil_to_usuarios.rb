class AddPerfilToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :perfil, :string
  end
end
