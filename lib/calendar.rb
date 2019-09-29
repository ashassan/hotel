class Calendar
  attr_reader :start_date, :end_date

  def initialize(start_date:, end_date:)
    @start_date = start_date
    @end_date = end_date

    if end_date < start_date
      raise ArgumentError.new("Invalid Date Range (end date is before start date)")
    end
  end

  def overlap?(current_reservation)
    return !(current_reservation.start_date >= end_date || current_reservation.end_date <= start_date)
  end
end
