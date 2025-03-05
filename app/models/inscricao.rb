class Inscricao < ApplicationRecord
    belongs_to :torneio
    belongs_to :usuario
  
    validates :torneio_id, presence: true
    validates :usuario_id, presence: true
    validates :data_hora, presence: true
    validates :usuario_id, uniqueness: { scope: :torneio_id, message: 'já está inscrito neste torneio' }
  end