class Reservation
  attr_reader :id, :start_date, :end_date, :room

  def initialize(id:, start_date:, end_date:, room:)
    @id = id
    @start_date = start_date
    @end_date = end_date
    @room = room
  end

  def total_cost
    200 * (@end_date - @start_date).to_i
  end
end
