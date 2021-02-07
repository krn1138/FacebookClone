class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :move_to_signed_in, only: [:destroy]

  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:danger] = ''
      redirect_to user_path(user.id), notice: "User was successfully created."
    else
      flash[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = t('notice.login_needed')
      redirect_to new_session_path
    end
  end
end
