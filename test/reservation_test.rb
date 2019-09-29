require_relative "test_helper"

describe "total_cost method" do
  before do
    @start_time = Date.new(2019, 9, 6)
    @end_time = Date.new(2019, 9, 9)
    @reservation = Reservation.new(id: 1, start_date: @start_time, end_date: @end_time, room: 5)
  end
  it "returns an instance of an integer" do
    expect(@reservation.total_cost).must_be_instance_of Integer
  end

  it "returns accurate calculation of total cost" do
    expect(@reservation.total_cost).must_equal 600
  end
end

describe "calculate days method" do
  before do
    @start_time = Date.new(2019, 2, 1)
    @end_time = Date.new(2019, 2, 5)
    @reservation = Reservation.new(id: 1, start_date: @start_time, end_date: @end_time, room: 5)
  end

  it " returns an array" do
    expect(@reservation.calculate_days).must_be_instance_of Array
  end
  it "returns accurate information for days included in reservation" do
    days = @reservation.calculate_days
    expect(days.length).must_equal 5
    [Date.new(2019, 2, 1), Date.new(2019, 2, 2), Date.new(2019, 2, 3), Date.new(2019, 2, 4), Date.new(2019, 2, 5)].each do |date|
      expect(days.include?(date)).must_equal true
    end
  end
end
