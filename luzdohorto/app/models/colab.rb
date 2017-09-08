class Colab < ApplicationRecord
  belongs_to :cadastro
  belongs_to :colaborador

  def self.buscaColabs (data_inicio, data_final)

  	if !data_inicio.blank? and !data_final.blank? and verificaData(data_inicio, data_final)
      puts "ESTE TESTE"
      puts "#{Colab.where(created_at: data_inicio.to_date.beginning_of_day..data_final.to_date.end_of_day).as_json}"
     Colab.where(created_at: data_inicio.to_date.beginning_of_day..data_final.to_date.end_of_day).find_by_sql('select count(colaborador_id), colaboradors.nomecompleto from colabs join colaboradors on colabs.colaborador_id = colaboradors.id group by colaboradors.nomecompleto WHERE ("colabs"."created_at" BETWEEN data_inicio AND data_final)')
     
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
