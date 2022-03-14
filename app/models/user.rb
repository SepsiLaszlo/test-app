class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:authsch]
         
  def self.from_omniauth(access_token)
    data = access_token.extra.raw_info
    user = User.find_by(uid: data['internal_id'])
  
      # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create!(name: data['displayName'],
            email: data['mail'],
            provider: 'authsch',
            uid: data['internal_id'],
            password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
