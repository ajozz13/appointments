class Appointment < ActiveRecord::Base
  validate :is_start_time_in_the_past, on: :create
  validate :is_end_time_appropriate
  validate :check_appointment_conflicts
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
  
  def appointment_range
    start_time..end_time
  end
  
  def check_appointment_conflicts
    @appointments = Appointment.where( 'start_time between ? and ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day )
    errors.add( :base, "There is a time conflict with another appointment" ) if
      ( @appointments.any? do |app| app.appointment_range.overlaps?( appointment_range ) end )
  end
  
end
