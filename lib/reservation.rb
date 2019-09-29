class Reservation
  attr_reader :id, :start_date, :end_date, :room, :date_range,:reservation_days

  def initialize(id:, start_date:, end_date:, room:)
    @id = id
    @start_date = start_date
    @end_date = end_date
    @room = room
  end

  def total_cost
    200 * (end_date - start_date).to_i
  end

  def calculate_days
    days = [] 
    current_date = end_date
    while current_date >= start_date 
      days << current_date 
      current_date -= 1
    end 
    return days 
  end 
  


end
