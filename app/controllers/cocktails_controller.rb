class CocktailsController < ApplicationController

  #======================== Create =====================
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  #======================== Read ========================
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  #======================== Update =======================
  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
  end

  # ====================== Delete =======================
  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  # =============================== [STRONG PARAMS]  ===========================
  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
