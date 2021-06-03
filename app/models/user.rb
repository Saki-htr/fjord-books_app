# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  has_many :followers,
           class_name: 'Friendship',
           foreign_key: 'follower_id',
           dependent: :destroy,
           inverse_of: :follower
  has_many :followings,
           class_name: 'Friendship',
           foreign_key: 'following_id',
           dependent: :destroy,
           inverse_of: :following

  has_many :following_users, through: :followers, source: :following
  has_many :follower_users, through: :followings, source: :follower

  def follow(other_user_id)
    followers.create(following_id: other_user_id)
  end

  def unfollow(other_user_id)
    followers.find_by(following_id: other_user_id).destroy
  end

  def following?(other_user)
    following_users.include?(other_user)
  end
end
