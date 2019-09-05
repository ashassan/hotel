
require_relative 'reservation'

class HotelBooker 
    attr_reader :rooms, :reservations 
    
    
    def initialize
        @rooms = []
        @reservations = []
    end 
    
    def  find_available_room(start_date, end_date)
        Calendar.new(start_date, end_date)

        
    end 
    def create_reservation(start_date, end_date)
        find_available_room(start_date, end_date)
       
        Reservation.new()


    end
    
    
    def find_reservation_by_date (date)

        
        
    end 




    
    
    
end 








