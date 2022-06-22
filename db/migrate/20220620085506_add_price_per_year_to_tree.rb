class AddPricePerYearToTree < ActiveRecord::Migration[6.1]
  def change
    add_column :trees, :price_per_year, :integer
    remove_column :reviews, :description
    add_column :reviews, :content, :text
  end
end
