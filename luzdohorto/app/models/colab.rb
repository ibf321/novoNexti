class Colab < ApplicationRecord
  belongs_to :cadastro
  belongs_to :colaborador

  def self.buscaColabs (data_inicio, data_final)

  	if !data_inicio.blank? and !data_final.blank? and verificaData(data_inicio, data_final)
      puts "ESTE TESTE"
      puts "#{Colab.where(created_at: data_inicio.to_date.beginning_of_day..data_final.to_date.end_of_day).as_json}"
     Colab.find_by_sql('select * from colabs where created_at between data_inicio and data_final, count(colaborador_id), colaboradors.nomecompleto from colabs join colaboradors on colabs.colaborador_id = colaboradors.id group by colaboradors.nomecompleto')
     
    else
      Colab.find_by_sql('select count(colabs.id), colaboradors.nomecompleto from colabs join colaboradors on colabs.colaborador_id = colaboradors.id group by colaboradors.nomecompleto')
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
