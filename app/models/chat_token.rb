class ChatToken < ActiveRecord::Base
  belongs_to :user
  validates :application, :uniqueness => true
end
