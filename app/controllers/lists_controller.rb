class ListsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  def edit
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

# create and update need private
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
