class AddNomeAndPerfilToUsuarios < ActiveRecord::Migration[8.0]
  def change
    # Verifica se a coluna 'nome' já existe antes de adicioná-la
    unless column_exists?(:usuarios, :nome)
      add_column :usuarios, :nome, :string
    end

    # Verifica se a coluna 'perfil' já existe antes de adicioná-la
    unless column_exists?(:usuarios, :perfil)
      add_column :usuarios, :perfil, :string
    end
  end
end