class Reservation 
    attr_reader :id, :start_date, :end_date,:room 

    def initialize (id:, start_date:, end_date:, room:)
        @id = id 
        @start_date = start_date
        @end_date = end_date 
        @room = room 

        if end_date < start_date 
            raise ArgumentError.new "Invalid Date Range (end date is before start date)"

        end 

    end 

    # guest does not have to pay for last day 
    def total_cost 

    end 



end 