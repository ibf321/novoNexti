class CreateColabs < ActiveRecord::Migration[5.0]
  def change
    create_table :colabs do |t|
      t.references :cadastro, foreign_key: true
      t.references :colaborador, foreign_key: true

      t.timestamps
    end
  end
end
