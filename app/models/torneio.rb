class Torneio < ApplicationRecord
    has_many :inscricoes, dependent: :destroy
    has_many :participantes, through: :inscricoes, source: :usuario
  
    validates :nome, presence: true
    validates :descricao, presence: true
    validates :data_inicio, presence: true
    validates :data_fim, presence: true
    validates :status, presence: true, inclusion: { in: %w[ativo inativo] }
  
    def pode_inscrever?
      status == 'ativo' && data_inicio > Time.current
    end
  end