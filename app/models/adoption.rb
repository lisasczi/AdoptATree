class Adoption < ApplicationRecord
  belongs_to :tree,  dependent: :destroy
  belongs_to :user
  has_many :reviews

  validates :starts_at, presence: true
  validates :ends_at, presence: true


  def self.overlap(period)
    period = FormatConverters.to_period(period)
    where(arel_table[:starts_at].lteq(period.end).and(arel_table[:ends_at].gteq(period.start)))
    end
  end

  def overlap?(period)
    period = FormatConverters.to_period(period)
    self.start <= period.end && self.end >= period.start
  end

  module FormatConverters

    module_function

    def to_period(obj)
      return obj if obj.respond_to?(:starts_at) && obj.respond_to?(:ends_at)
      obj..obj
    end


end
