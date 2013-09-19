class UsersController < ApplicationController
  before_filter :require_login, :except => [:new, :create, :reset_password, :send_mail_forget_password]
  def new
    @user = User.new
  end

  def create
    puts params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver

      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
    
  end

  def reset_password
    
  end

  def send_mail_forget_password
    user = User.find_by_email(params[:email])
    if user.present?
      random_password = Array.new(10).map { (65 + rand(58)).chr }.join
      user.password = random_password
      user.is_random_pwd = true
      user.save!
      UserMailer.reset_password(user, random_password).deliver
      
     redirect_to reset_password_path, :notice => "Message sent successfully"
    else
      redirect_to reset_password_path, :alert => 'No user registered with this email'
    end
    
  end

  def change_password
    @user = User.find(params[:id])
  end

  def update_password
    if params[:password] == params[:password_confirmation]
      @user = User.find(params[:id])
      @user.password = params[:password]
      @user.is_random_pwd = false
      @user.save!
      redirect_to change_password_user_path(@user), :notice => "Updated Password Successfully!"
    else
      redirect_to change_password_user_path(@user), :alert => "Password and Password Confirmation are not same!"
    end
  end

end 