class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @clients = Client.all
    @sales = Sale.all
    @products = Product.all

    @chart_data = {
      labels: %w[January February March April May June July],
      datasets: [{
        label: 'My First dataset',
        backgroundColor: 'transparent',
        borderColor: '#3B82F6',
        data: [37, 83, 78, 54, 12, 5, 99]
      }]
    }

    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end

  private

  def current_store
    @current_store ||= current_user.store if user_signed_in?
  end
  helper_method :current_store
end
