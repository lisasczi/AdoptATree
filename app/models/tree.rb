class Tree < ApplicationRecord
  belongs_to :user
  has_many :adoptions

  validates :name, presence: true
  validates_inclusion_of :fruits, :in => ["Apple", "Apricot", "Cherry", "Chestnut", "Coconut tree", "Fig", "Grapefruit", "Hazel", "Mandarin", "Mirabellier", "Mulberry", "Olivier", "Orange", "Pear", "Plum"]
  validates :address, presence: true
  validates :fruits, presence: true
  validates :description, presence: true, length: {in: 20..280}
  validates :quantity_by_year, presence: true, numericality: { greater_than: 0}
  validates :price, presence: true, numericality: { greater_than: 0}

  # def self.available(period)
  #   adoptions = Adoption.overlap(period)
  #   where.not(id: adoptions.select(:tree_id))
  # end

  # def available?(period)
  #   if adoptions.loaded?
  #     adoptions.none? { |adoption| adoption.overlap?(period) }
  #   else
  #     adoptionsadoption.overlap(period).none?
  #   end
  # end

  # def images_tree
  #   case fruits
  #   when 'Apple' then "apple.png"
  #   when ' Apricot' then "apricot.jpg"
  #   when 'Cherry' then "cherry.jpg"
  #   when 'Chestnut' then "chestnut.jpg"
  #   when 'Coconut tree' then "coconut.jpg"
  #   when 'Fig' then "fig.jpg"
  #   when 'Grapefruit' then "grapefruit.jpg"
  #   when 'Hazel' then "hazel.jpg"
  #   when 'Mandarin' then "mandarin.jpg"
  #   when 'Mango' then "mango.jpg"
  #   when 'Mirabellier' then "mirabellier.jpg"
  #   when 'Mulberry' then "mulberry.jpg"
  #   when 'Olivier' then "olivier.jpg"
  #   when 'Orange' then "oranger.jpg"
  #   when 'Pear' then "pear.jpg"
  #   when 'Plum' then "plum.jpg"
  #   end
  # end

  def available?(from, to)
    adoptions.where('starts_at_booking <= ? AND ends_at_booking >= ?', to, from).none?
  end
end
