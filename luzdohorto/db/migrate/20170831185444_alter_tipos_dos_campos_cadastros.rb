class AlterTiposDosCamposCadastros < ActiveRecord::Migration[5.0]
  def change
  	change_column :cadastros, :id_cliente_coelce, :string
  	change_column :cadastros, :digito_verificador_cliente_coelce, :string
  	change_column :cadastros, :parcelas, :string
  	change_column :cadastros, :codigo_ocorrencia, :string  	
  end
end
