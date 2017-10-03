class Colab < ApplicationRecord
  belongs_to :cadastro
  belongs_to :colaborador
  paginates_per 20

  def self.buscaColabs (data_inicio, data_final)

  	if !data_inicio.blank? and !data_final.blank? and verificaData(data_inicio, data_final) and data_inicio != data_final
     
     Colab.find_by_sql(["select count(colabs.id), cadastros.valor, colaboradors.nomecompleto from colabs 
                        join colaboradors on colabs.colaborador_id = colaboradors.id 
                        join cadastros on colabs.cadastro_id = cadastros.id where colabs.created_at between '#{data_inicio}' and '#{data_final}' group by cadastros.valor, colaboradors.nomecompleto order by nomecompleto asc"])
    
    elsif !data_inicio.blank? and !data_final.blank? and data_inicio == data_final
       Colab.find_by_sql(["select count(colabs.id), cadastros.valor, colaboradors.nomecompleto from colabs 
                        join colaboradors on colabs.colaborador_id = colaboradors.id 
                        join cadastros on colabs.cadastro_id = cadastros.id where colabs.created_at = '#{data_inicio}'  group by cadastros.valor, colaboradors.nomecompleto order by nomecompleto asc"])    
    
    else      
      Colab.find_by_sql('select count(colabs.id), cadastros.valor, colaboradors.nomecompleto from colabs 
                        join colaboradors on colabs.colaborador_id = colaboradors.id 
                        join cadastros on colabs.cadastro_id = cadastros.id
                        group by cadastros.valor, colaboradors.nomecompleto order by nomecompleto asc')
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
