class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  before_filter :cart_current
  before_filter :news_show
  before_filter :catalog_links
  protect_from_forgery

  def news_show
    @news_show = News.order("created_at desc").limit(2)
  end
  def catalog_links
    @catalog_links = Category.all
  end
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
