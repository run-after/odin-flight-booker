class PassengerMailer < ApplicationMailer
  default from: 'notifications@airline.com'

  def thank_you_email
    @booking = params[:booking]
    @booking.passengers.each do |pass|
      @passenger = pass
      mail(to: pass.email, subject: 'Thank you for booking your flight!')
    end
  end
end