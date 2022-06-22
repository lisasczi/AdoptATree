class CreateAdoptions < ActiveRecord::Migration[6.1]
  def change
    create_table :adoptions do |t|
      t.references :tree, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
