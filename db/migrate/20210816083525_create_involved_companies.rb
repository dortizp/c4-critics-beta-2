class CreateInvolvedCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :involved_companies do |t|
      t.references :game, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.boolean :developer, default: false
      t.boolean :publisher, default: false

      t.timestamps
    end
    add_index :involved_companies, [:game_id, :company_id], unique: true
  end
end
