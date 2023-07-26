class User < ApplicationRecord
  validates :numero, presence: true, uniqueness: true, length: { is: 8 }
  validates :usuario, presence: true, uniqueness: true, length: {maximum: 10}
  validates :captcha, inclusion: { in: [true], message: "debe ser marcado" }
end
