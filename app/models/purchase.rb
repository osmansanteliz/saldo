class Purchase < ApplicationRecord
  belongs_to :user
  validates :monto, presence: true
  validates :purchase_date, presence: true
  validates :numero, presence: true
  validates_presence_of :numero
  attr_accessor :numero
  before_save :set_purchase_date

  private
  def set_purchase_date
    self.purchase_date ||= Date.current
  end  

end
