class Usuario < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Validações
  validates :nome, presence: true
  validates :perfil, presence: true, inclusion: { in: ['Organizador', 'Participante'] }
end