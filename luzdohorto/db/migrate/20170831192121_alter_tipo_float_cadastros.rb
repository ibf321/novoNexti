class AlterTipoFloatCadastros < ActiveRecord::Migration[5.0]
  def change
  	change_column :cadastros, :valor, :string
  end
end
