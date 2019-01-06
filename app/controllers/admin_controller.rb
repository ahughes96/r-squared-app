class AdminController < ApplicationController
    def index
        @bookings = Booking.all
        @rooms = Room.all
        @users = User.all
    end
end
