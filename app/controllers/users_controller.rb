# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @followings = @user.following_users.with_attached_avatar
  end

  def followers
    @followers = @user.follower_users.with_attached_avatar
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
