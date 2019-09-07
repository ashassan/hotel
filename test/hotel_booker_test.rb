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

    it "checks if it adds the reservation " do
      hotel = HotelBooker.new
      
  end

  describe "find_reservation_by_date" do
    it "" do
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
  end
end
