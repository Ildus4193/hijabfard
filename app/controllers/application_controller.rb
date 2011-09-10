class ApplicationController < ActionController::Base
  before_filter :cart_current
  protect_from_forgery
  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
    def cart_current
      @cart = current_cart
    end
end
