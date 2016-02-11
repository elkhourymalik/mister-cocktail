class DosesController < ApplicationController
  before_action :set_cocktail, only: [:show, :new, :create, :edit, :update]
  before_action :set_dose, only: [:show, :destroy, :edit, :update]
  def index
    @doses = Dose.all
  end

  def show

  end

  def new
    @dose = Dose.new
  end

  def edit
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @dose.update(dose_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    cocktail_id = @dose.cocktail_id
    @dose.delete
    redirect_to cocktail_path(cocktail_id)
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
