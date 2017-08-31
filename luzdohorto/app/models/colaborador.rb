class Colaborador < ApplicationRecord
  belongs_to :user
  has_many :colabs
  has_many :colaborador, through: :colabs 
  paginates_per 20
end
