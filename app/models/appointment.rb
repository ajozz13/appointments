class Appointment < ActiveRecord::Base
  validate :is_start_time_in_the_past, on: :create
  validate :is_end_time_appropriate
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :comment 
  
  def is_start_time_in_the_past
    errors.add( :start_time, "can't be in the past" ) if
      !start_time.blank? and start_time < Date.today
  end
  
  def is_end_time_appropriate
    errors.add( :end_time, "can't be prior to the start time" ) if
      !end_time.blank? and end_time < start_time
  end
  
end
