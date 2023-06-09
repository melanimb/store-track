class ClientsController < ApplicationController
  before_action :set_store
  before_action :set_client, only: %i[show edit update destroy]

  def index
    @clients = if params[:query].present?
                query = "%#{params[:query]}%"
                @store.clients.where("name LIKE ? OR surname LIKE ? OR email LIKE ?", query, query, query)
              else
                @store.clients
              end
  end

  def show; end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)
    @client.store = current_user.store

    if @client.save
      redirect_to client_url(@client), notice: 'Client was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @client.update(client_params)
      redirect_to client_url(@client), notice: 'Client was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy

    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private

  def set_client
    @client = @store.clients.find_by(id: params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :surname, :address, :email, :phone)
  end

  def set_store
    @store = current_user.store
  end
end
