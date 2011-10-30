# coding: utf-8
class Notifier < ActionMailer::Base
  default :from => "ildus523@mail.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order
    @url = "http://hijab-fard.ru"
    mail(:to => order.email, :subject => 'Thank you!!!')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order
    mail :to => order.email, :subject => 'Спасибо за покупку!!!'
  end

end
