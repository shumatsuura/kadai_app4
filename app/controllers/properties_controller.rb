class PropertiesController < ApplicationController
  before_action :set_property, only: [:show,:edit,:update,:destroy]

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to propeties_path, notice:"物件が登録されました。"
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @properties = Property.all
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice:"物件を編集しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @propety.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:name,:address, :age,:note)
  end

  def set_property
    @property = Property.find(params[:id])
  end

end
