class UserMailer < ActionMailer::Base
  default from: "shiva1610@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://example.com/log_in"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
  
  def contact_us(user)
      @user = user
      mail(:to => "sivakrishna3259@gmail.com", :subject => "see the contact_us details")
  end
  def reset_password(user, random_password)
    @user = user
    @randompassword = random_password
     mail(:to => user.email, :notice => "A Random password sen")
  end
  
end
