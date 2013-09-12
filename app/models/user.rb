class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable
  has_many :clients
end
