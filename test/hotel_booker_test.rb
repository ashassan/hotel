require_relative "test_helper"

describe "Wave 1 " do
  describe "initialize" do
    before do
      @hotel = HotelBooker.new
    end
    it "creates  20 rooms " do
      expect(@hotel.rooms.length).must_equal 20
    end
    it "checks that rooms are integers" do
      expect(@hotel.rooms).must_be_instance_of Array
      @hotel.rooms.each do |room|
        expect(room).must_be_instance_of Integer
      end
    end
  end

  describe " create_reservation" do
    it "returns a reservation" do
      hotel = HotelBooker.new
      reservation = hotel.create_reservation(1, Date.new(2019, 2, 3), Date.new(2019, 2, 6))
      expect(reservation).must_be_instance_of Reservation
    end

    it "checks if new reservation is added to reservations" do
      hotel = HotelBooker.new
      hotel.create_reservation(1, Date.new(2019, 2, 5), Date.new(2019, 2, 9))
      expect(hotel.reservations[1].length).must_equal 1
    end
    it "doesnt make conflicting reservations for the same room" do
      hotel = HotelBooker.new
      hotel.create_reservation(1, Date.new(2019, 2, 6), Date.new(2019, 2, 11))
      hotel.create_reservation(4, Date.new(2019, 2, 7), Date.new(2019, 2, 10))

      expect(hotel.reservations[1].length).must_equal 1
      expect(hotel.reservations[2].length).must_equal 1
    end
    it "checks that new reservations can start on checkout days" do
      hotel = HotelBooker.new
      hotel.create_reservation(1, Date.new(2019, 2, 6), Date.new(2019, 2, 11))
      hotel.create_reservation(2, Date.new(2019, 2, 1), Date.new(2019, 2, 6))
      expect(hotel.reservations[1].length).must_equal 2
    end
  end

  describe "find_reservation_by_date" do
    before do
      @hotel = HotelBooker.new
      @hotel.create_reservation(1, Date.new(2019, 2, 6), Date.new(2019, 2, 11))
      @hotel.create_reservation(2, Date.new(2019, 2, 1), Date.new(2019, 2, 6))
      @hotel.create_reservation(3, Date.new(2019, 2, 3), Date.new(2019, 2, 12))
      @hotel.create_reservation(4, Date.new(2019, 2, 7), Date.new(2019, 2, 10))
      @hotel.create_reservation(5, Date.new(2019, 2, 8), Date.new(2019, 2, 13))
    end
    it "returns an array of reservations" do
      found_reservations = @hotel.find_reservation_by_date(Date.new(2019, 2, 10))
      expect(found_reservations).must_be_instance_of Array
      found_reservations.each do |reservation|
        expect(reservation).must_be_instance_of Reservation
      end
    end
    it "all returned reservations inlcude the date" do
      found_reservations = @hotel.find_reservation_by_date(Date.new(2019, 2, 6))
      expect(found_reservations[0].id).must_equal 1
      expect(found_reservations[1].id).must_equal 2
      expect(found_reservations[2].id).must_equal 3
      expect(found_reservations[3]).must_be_nil
    end
  end
end
describe "Wave 2" do
  describe "find_available_room" do
    it "returns an array of available rooms" do
      hotel = HotelBooker.new
      available_rooms = hotel.find_available_room(Date.new(2019, 2, 5), Date.new(2019, 2, 9))
      expect(available_rooms).must_be_instance_of Array
    end

    it "returns all the rooms when the array is empty" do
      hotel = HotelBooker.new
      available_rooms = hotel.find_available_room(Date.new(2019, 2, 5), Date.new(2019, 2, 9))
      expect(available_rooms.length).must_equal 20
    end

    it "returns only empty rooms " do
      hotel = HotelBooker.new

      hotel.create_reservation(1, Date.new(2019, 2, 6), Date.new(2019, 2, 11))

      hotel.create_reservation(2, Date.new(2019, 2, 1), Date.new(2019, 2, 8))

      hotel.create_reservation(3, Date.new(2019, 2, 8), Date.new(2019, 2, 12))
      hotel.create_reservation(4, Date.new(2019, 2, 11), Date.new(2019, 2, 14))
      hotel.create_reservation(5, Date.new(2019, 2, 11), Date.new(2019, 2, 14))
      available_rooms = hotel.find_available_room(Date.new(2019, 2, 5), Date.new(2019, 2, 9))
      expect(available_rooms[0]).must_equal 3
      expect(available_rooms.length).must_equal 18
    end
  end
end
