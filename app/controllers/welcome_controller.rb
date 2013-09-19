class WelcomeController < ApplicationController
  
  
  def index
    
  @todos = current_user ? current_user.todos : []
  
  end
  
  def about_us
    
  end
  
  def contact_us
  
  end
  def sendmail
     user = params['user']
     UserMailer.contact_us(user).deliver
     flash[:notice] ='Message sent successfully'
  end
 
  
end
