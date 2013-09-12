class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable
  has_many :clients

  def admin?
    role == "admin"
  end

  def display_name
    trading_name || email
  end

  def address
    "#{address_line_1}, #{address_line_2}<br/>#{suburb} #{state.try(:upcase)} #{postcode}"
  end
end
