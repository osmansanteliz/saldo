class AddCaptchaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :captcha, :boolean
  end
end
