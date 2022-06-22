class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :adoption, null: false, foreign_key: true
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
