module ApplicationHelper
  def time_picker_format input_date
    return "" if input_date.nil?
    return input_date.strftime( "%Y-%m-%d %H:%M" )
  end
end
