class Ingredient < ApplicationRecord
  before_destroy :check_for_doses

  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, uniqueness: true, presence: true

  def check_for_doses
    if self.doses.count > 0
      raise ActiveRecord::InvalidForeignKey
    end
  end
end
