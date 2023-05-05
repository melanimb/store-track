class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @clients = Client.all
    @sales = Sale.all
    @products = Product.all
  end

  private

  def current_store
    @current_store ||= current_user.store if user_signed_in?
  end
  helper_method :current_store
end
