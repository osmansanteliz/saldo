class Purchase < ApplicationRecord
  belongs_to :user
  validates :monto, presence: true
  validates_presence_of :numero
  attr_accessor :numero
end
