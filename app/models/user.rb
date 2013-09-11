class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable
  belongs_to :company
end
