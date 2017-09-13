class Colab < ApplicationRecord
  belongs_to :cadastro
  belongs_to :colaborador

  def self.buscaColabs (data_inicio, data_final)

  	if !data_inicio.blank? and !data_final.blank? and verificaData(data_inicio, data_final) and data_inicio != data_final
     Colab.find_by_sql(["SELECT count(colaboradors.id), colaboradors.nomecompleto FROM colabs FULL OUTER JOIN colaboradors  ON colabs.colaborador_id = colaboradors.id where colabs.created_at between '#{data_inicio}' and '#{data_final}' group by colaboradors.nomecompleto"])
    elsif !data_inicio.blank? and !data_final.blank? and data_inicio == data_final
       Colab.find_by_sql(["SELECT count(colaboradors.id), colaboradors.nomecompleto FROM colabs FULL OUTER JOIN colaboradors  ON colabs.colaborador_id = colaboradors.id where colabs.created_at = '#{data_inicio}'  group by colaboradors.nomecompleto"])    
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
