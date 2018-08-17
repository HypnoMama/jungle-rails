class UserMailer < ApplicationMailer
  default from: 'kalika_00@hotmail.com'

  def order_summary(user, order_id)
    @url = 'http://localhost:3000/orders'
    mail(to: user.email, subject: order_id)
  end


end
