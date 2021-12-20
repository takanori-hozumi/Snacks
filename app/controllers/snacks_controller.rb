class SnacksController < ApplicationController
  def index
    @snacks = Snack.all
    @snack = Snack.new
  end

  def show
    @snack = Snack.find(params[:id])
  end

  def create
    @snack = Snack.new(snack_params)
    if @snack.save
      flash[:notice] = "Snack was successfully created."
      redirect_to snack_path(@snack.id)
    else
      @snacks = Snack.all
      render :index
    end
  end

  def edit
    @snack = Snack.find(params[:id])
  end

  def update
    snack = Snack.find(params[:id])
    if flash[:notice] = "Snack was successfully created."
      snack.update(snack_params)
      redirect_to snack_path(snack)
    else
      render :edit
    end
  end

  def destroy
    snack = Snack.find(params[:id])
    snack.destroy
    redirect_to snacks_path
  end

  private

  def snack_params
    params.require(:snack).permit(:title, :category, :body)
  end
end
