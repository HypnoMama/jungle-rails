class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_summary(user, order, items)
    @items = items
    @order = order
    @url = 'http://localhost:3000/orders'
    mail(to: user.email, subject: "Your order  ##{@order.id} has been received!")
  end


end
