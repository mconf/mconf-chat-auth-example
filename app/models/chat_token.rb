class ChatToken < ActiveRecord::Base
  belongs_to :user
  validates :application, :uniqueness => { :scope => :user_id }
end
