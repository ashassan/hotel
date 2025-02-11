
require_relative 'reservation'
require_relative 'calendar'

class NoAvailableRoomsError < StandardError 
end 
class HotelBooker
  attr_reader :rooms, :reservations

  def initialize
    @rooms = (1..20).map { |i| i }

    @reservations = {}

    @rooms.each do |room|
      @reservations[room] = []
    end
  end

  def find_available_room(start_date, end_date)
    available_rooms = []
    reservations.each do |room, reservations|
      if reservations.empty?
        available_rooms << room
      else
        date_range = Calendar.new(start_date: start_date, end_date: end_date)
        if reservations.all? { |reservation| !date_range.overlap?(reservation) }
          available_rooms << room
        end
      end
    end

    return available_rooms
  end

  def create_reservation(id, start_date, end_date)
    found_rooms = find_available_room(start_date, end_date)

    if found_rooms.empty?
      raise NoAvailableRoomsError
    else
      new_reservation = Reservation.new(id: id, start_date: start_date, end_date: end_date, room: found_rooms.first)
      reservations[found_rooms.first] = reservations[found_rooms.first] << new_reservation

      return new_reservation
    end
  end

  def find_reservation_by_date(date)
    reservations_for_date = reservations.map do |room, reservation| 
    reservation.find_all { |reservation| reservation.calculate_days.include?(date)}
    end 
    return reservations_for_date.flatten
  end
end
