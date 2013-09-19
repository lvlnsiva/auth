class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      redirect_to root_url, :alert => "Please enter valid credentials"
    else
      session[:user_id] = user.id
      puts "user.is_random_pwd => #{user.is_random_pwd}"
      puts "user.is_random_pwd == true => #{user.is_random_pwd == true}"
      if user.is_random_pwd == true
        redirect_to root_url, :notice => "welcome "  +  user.email  +  " please change your password"
      else
        redirect_to root_url, :notice => "welcome "  +  user.email
      end
    end
  end
 



  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
