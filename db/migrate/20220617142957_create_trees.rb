class CreateTrees < ActiveRecord::Migration[6.1]
  def change
    create_table :trees do |t|
      t.string :fruits
      t.integer :quantity_by_year
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.text :description
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
