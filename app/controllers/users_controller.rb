class UsersController < ApplicationController
  #ログインしていない時、ログイン画面にリダイレクト
  before_action :authenticate_user!, only: :index

  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
