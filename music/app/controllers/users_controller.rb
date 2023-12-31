class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:show]
    
   def create 
    @user = User.new(user_params)
    if @user.save 
        login!(@user)
        redirect_to user_url
    else
        render :new
    end
   end

   def new 
    @user = User.new 

    render :new 
   end

   def show 
    @user = User.find(params[:id])

    render :show 
   end



   private 

   def user_params 
    params.require(:user).permit(:email, :password_digest, :session_token)
   end
end
