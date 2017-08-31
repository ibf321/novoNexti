class CreateColaboradors < ActiveRecord::Migration[5.0]
  def change
    create_table :colaboradors do |t|
      t.string :nomecompleto
      t.string :telefone
      t.string :endereco
      t.string :nomereduzido
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
