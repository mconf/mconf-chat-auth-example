class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def update_token
    update_attributes(chat_token: SecureRandom.hex(8))
  end

  def chat_identifier
    chat_application || chat_token
  end

end
