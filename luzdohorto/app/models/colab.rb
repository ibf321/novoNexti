class Colab < ApplicationRecord
  belongs_to :cadastro
  belongs_to :colaborador

  def self.buscaColabs (data_inicio, data_final)

  	if !data_inicio.blank? and !data_final.blank? and verificaData(data_inicio, data_final)
     Colab.select('colaborador_id.*').where(created_at: data_inicio.to_date.beginning_of_day..data_final.to_date.end_of_day)
     
    else
      Colab.order(colaborador_id: :desc).group(:colaborador_id)
    end
  end

  def self.verificaData (data_inicio, data_final)
  	if data_inicio > data_final  	    
  	    false 
  	else
  		true
  	end
  end

end
