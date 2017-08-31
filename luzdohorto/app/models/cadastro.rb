class Cadastro < ActiveRecord::Base
	belongs_to :user
	has_many :colabs
	paginates_per 20

	def self.assocCadColab (cadastro_id, colaborador_id)
  		colab = Colab.new
  		colab.cadastro_id = cadastro_id
  		colab.colaborador_id = colaborador_id
  		colab.save
  	end

  	def self.search(query, user)
    	if query.present? and user.role == "admin"
      		where(['id_cliente_coelce like :query OR
            	valor like :query OR livre like :query', query: "%#{query}%"])
    	elsif query.present?
    		where(:user_id => user.id).where(['id_cliente_coelce like :query OR
            	valor like :query ', query: "%#{query}%"])
    	elsif user.role == "admin"
    		all
    	else
    		where(:user_id => user.id)
    	end
    end
	
end
