class User < ApplicationRecord
  has_many :purchases
  validates :numero, presence: true, uniqueness: true, length: { is: 8 }
  validates :usuario, presence: true, uniqueness: true, length: {maximum: 10}
  validates :captcha, inclusion: { in: [true], message: "debe ser marcado" }

  def saldo_final
    purchases.sum(:monto)
  end  
end
