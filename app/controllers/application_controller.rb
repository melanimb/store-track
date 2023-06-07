class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :turbo_frame_request_variant

  def index
    @clients = Client.all
    @sales = Sale.all
    @products = Product.all

    @chart_clients_data = {
      labels: chart_months,
      datasets: [{
        label: 'Clients',
        data: [37, 83, 78, 54, 12, 30, 64]
      }]
    }

    @chart_clients_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      aspectRatio: 1,
    }

    @chart_products_data = {
      labels: chart_months,
      datasets: [{
        label: 'Products',
        data: [37, 83, 78, 54, 12, 30, 64]
      }]
    }

    @chart_products_options = {
      aspectRatio: 1,
    }

    @chart_sales_data = {
      labels: chart_months,
      datasets: [{
        label: 'Sales',
        data: [37, 83, 78, 54, 12, 30, 64]
      }]
    }

    @chart_sales_options = {
      aspectRatio: 1,
    }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :store_id])
  end

  private

  def current_store
    @current_store ||= current_user.store if user_signed_in?
  end
  helper_method :current_store

  def chart_months
    %w[January February March April May June July]
  end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
