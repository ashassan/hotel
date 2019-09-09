require_relative 'test_helper'

    describe "total_cost method" do 
        before do 
           
            @start_time = Date.new(2019,9,6)
            @end_time = Date.new(2019,9,9)
            @reservation = Reservation.new(id: 1, start_date: @start_time, end_date: @end_time, room: 5  )
        
        end 
        it "checks that it returns an instance of an integer" do 
           expect(@reservation.total_cost).must_be_instance_of Integer 

        end 
        
        it "checks that it returns accurate calculation" do 
            expect(@reservation.total_cost).must_equal 600

        end 
        
        
    
    end 
    