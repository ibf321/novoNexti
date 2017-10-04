class Colaborador < ApplicationRecord
  belongs_to :user
  has_many :colabs
  has_many :colaborador, through: :colabs 
  paginates_per 20

  validates_presence_of :nomecompleto, :telefone, :endereco, :nomereduzido
  validates :nomecompleto, uniqueness: true
  validates :nomereduzido, uniqueness: true
 

end
