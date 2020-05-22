class SessionController < ApplicationController
  skip_before_action :require_signed_in!

  def new
  end

  def create
    if user
      sign_in(user)
      redirect_to index_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to users_new_url
  end

  private

  def user
    @user ||= User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
  end
end