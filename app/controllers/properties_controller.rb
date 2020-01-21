class PropertiesController < ApplicationController
  before_action :set_property, only: [:show,:edit, :update, :destroy]

  def new
    @property = Property.new
    @property.stations.build
    @page_title = "登録"
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice:"物件が登録されました。"
    else
      render 'new'
    end
  end

  def show
    @stations = @property.stations
  end

  def index
    @properties = Property.all
  end

  def edit
    if @property.stations.last.name == "" and @property.stations.last.minute == nil and @property.stations.last.line ==""
    else
      @property.stations.build
    end
    @page_title = "編集"
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice:"物件を編集しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, stations_attributes: [:id, :line,:name,:minute,:property_id])
  end

  def set_property
    @property = Property.find(params[:id])
  end

end
