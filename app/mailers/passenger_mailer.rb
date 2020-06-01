class PassengerMailer < ApplicationMailer
  default from: 'notifications@airline.com'

  def thank_you_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Thank you for booking your flight!')
  end
end