class Cadastro < ActiveRecord::Base
	belongs_to :user
	has_many :colabs
	paginates_per 20

  validates_presence_of :id_cliente_coelce, :digito_verificador_cliente_coelce, :codigo_ocorrencia, :valor, :parcelas
  validates :id_cliente_coelce, length: { maximum: 10, too_long: "é maior que o aceitável de 10 digitos. Verifique e tente novamente." }
  validates :digito_verificador_cliente_coelce, length: { maximum: 2, too_long: "é maior que o aceitável de 2 digitos. Verifique e tente novamente." }
  validates :codigo_ocorrencia, length: { maximum: 2, too_long: "é maior que o aceitável de 2 digitos. Verifique e tente novamente." }
  validates :parcelas, length: { maximum: 2, too_long: "é maior que o aceitável de 2 digitos. Verifique e tente novamente." }
	
  def self.assocCadColab (cadastro_id, colaborador_id)
  		colab = Colab.new
  		colab.cadastro_id = cadastro_id
  		colab.colaborador_id = colaborador_id
  		colab.save
  	end

  	def self.search(query, user)
      if query.present? and user.role == "admin"
      		where(['id_cliente_coelce::text LIKE :query OR
            	valor::text LIKE :query OR livre::text LIKE :query', query: "%#{query}%"])
    	elsif query.present?
    		where(:user_id => user.id).where(['id_cliente_coelce::text LIKE :query OR
            	valor::text LIKE :query OR livre::text LIKE :query', query: "%#{query}%"])
    	elsif user.role == "admin"
    		all
    	else
    		where(:user_id => user.id)
    	end
    end
	
end
