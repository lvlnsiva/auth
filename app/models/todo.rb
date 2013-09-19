class Todo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :name, :description, :target_date, :status
  validates :name,  :presence => true, :allow_blank => true
  validates :description, :presence => true,
                    :length => { :minimum => 5 }, :allow_blank => true
                   
  validate :validate_target_date
 # before_validation :convert_date
  def validate_target_date 
    puts target_date.inspect
    errors.add(:base, "date should not be lessthan current date") if target_date < Date.today.to_time
  end
  
  def convert_date
    target_date = Date.parse(target_date)
  end
   
                     
  
  
end