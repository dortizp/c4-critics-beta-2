class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :summary
      t.date :release_date
      t.integer :category
      t.decimal :rating
      t.references :parent, index: true

      t.timestamps
    end
    add_index :games, :name, unique: true
  end
end
