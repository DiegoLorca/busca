class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @clients = Client.all
    @hash = Gmaps4rails.build_markers(@clients) do |client, marker|
      marker.lat client.latitude
      marker.lng client.longitude
      marker.infowindow client.title
      
    end
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'El Profesor fue Creado Correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'El Profesor fue Actualizado Correctamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'El Profesor fue Eliminado Correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:latitude, :longitude, :address, :description, :title)
    end
end
