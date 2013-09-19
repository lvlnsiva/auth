class User < ActiveRecord::Base
  has_many :todos
  attr_accessible :email, :password_hash, :password_salt, :password_confirmation, :password, :is_random_pwd
  
  attr_accessor :password
  before_save :encrypt_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true, unless: Proc.new { |a| !a.new_record? && a.password.blank? }
  validates_confirmation_of :password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
   def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
   end
   
   def send_mail_forget_password
     
   end
  
  
end
