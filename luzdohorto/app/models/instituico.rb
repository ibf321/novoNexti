class Instituico < ApplicationRecord
	validates_presence_of :nome_instituicao, :id_cliente_parceira, :codigo_produto, :codigo_empresa_parceira
end
