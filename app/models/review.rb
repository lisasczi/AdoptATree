class Review < ApplicationRecord
  belongs_to :user
  belongs_to :adoption,  dependent: :destroy
  validates :rating, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }
  validates :description, presence: true, length: {in: 3..114}
end
