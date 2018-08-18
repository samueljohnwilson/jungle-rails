class OrderMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = "localhost:3000"
    @order = Order.last
    mail(to: user.email, subject: "Welcome to the Jungle! Order Number: #{@order.id}")
  end

end
