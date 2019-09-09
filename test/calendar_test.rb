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

    it "returns true if new reservation endate overlaps " do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 3), end_date: Date.new(2019, 2, 6))
      expect(date_range.overlap?(@reservation)).must_equal true
    end

    it " returns true if new reserveration start date overlaps" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 6), end_date: Date.new(2019, 2, 11))
      expect(date_range.overlap?(@reservation)).must_equal true
    end

    it " returns true if new reservation start_date and end_date both overlap" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 6), end_date: Date.new(2019, 2, 8))
      expect(date_range.overlap?(@reservation)).must_equal true
    end
    it "returns true if new reservation includes both start_date and endate" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 3), end_date: Date.new(2019, 2, 14))
      expect(date_range.overlap?(@reservation)).must_equal true
    end
    it "returns true if new reservation is exactly the same" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 5), end_date: Date.new(2019, 2, 9))
      expect(date_range.overlap?(@reservation)).must_equal true
    end

    it "returns false if new reservation is completely before" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 1), end_date: Date.new(2019, 2, 3))
      expect(date_range.overlap?(@reservation)).must_equal false
    end
    it "returns false if new reservation is completely after" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 11), end_date: Date.new(2019, 2, 15))
      expect(date_range.overlap?(@reservation)).must_equal false
    end

    it "returns false if new reservation starts on end date  " do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 9), end_date: Date.new(2019, 2, 16))
      expect(date_range.overlap?(@reservation)).must_equal false
    end

    it "returns false if new reservation ends on start date" do
      date_range = Calendar.new(start_date: Date.new(2019, 2, 1), end_date: Date.new(2019, 2, 5))
      expect(date_range.overlap?(@reservation)).must_equal false
    end
  end
end
