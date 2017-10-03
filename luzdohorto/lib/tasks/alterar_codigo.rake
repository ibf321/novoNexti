# encoding: utf-8
namespace :app do
	desc "Modifica o campo codigo do produto"
	task alterar_cod_produto: :environment do
		unless Cadastro.attribute_names.include? "codigo_ocorrencia"
			puts "Todos os campos foram alterados."
			return
		end
		Cadastro.find_each do |cadastro|
			puts "Alterando o campo codigo_ocorrencia"
			cadastro.codigo_ocorrencia = "60"
			cadastro.save!
		end
	end
end