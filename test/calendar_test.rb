require_relative "test_helper"

describe "wave 2" do
  describe "initialize " do
    it "raises an argument error for invalid date range" do
      expect { Calendar.new(start_date: Date.new(2019, 2, 9), end_date: Date.new(2019, 2, 3)) }.must_raise ArgumentError
    end
  end
  describe "overlap?" do
    before do
      @reservation = Reservation.new(id: 1, start_date: Date.new(2019, 2, 5), end_date: Date.new(2019, 2, 9), room: 5)
    end

    it "new reservation endate overlaps " do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 3), end_date: Date.new(2019, 2, 6))
      expect(date_range.overlap?(@reservation)).must_equal true
    end

    it " new reserveration start overlaps" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 6), end_date: Date.new(2019, 2, 11))
      expect(date_range.overlap?(@reservation)).must_equal true
    end

    it " new reservation start_date and end_date both overlap" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 6), end_date: Date.new(2019, 2, 8))
      expect(date_range.overlap?(@reservation)).must_equal true
    end
    it "new reservation includes start_date and endate of current reservation" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 3), end_date: Date.new(2019, 2, 14))
      expect(date_range.overlap?(@reservation)).must_equal true
    end
  end
end
