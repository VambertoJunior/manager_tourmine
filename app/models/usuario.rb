class Usuario < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :inscricoes, dependent: :destroy
  has_many :torneios, through: :inscricoes

  validates :nome, presence: true
  validates :perfil, presence: true, inclusion: { in: %w[Organizador Participante] }
end