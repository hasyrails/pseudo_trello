class ListsController < ApplicationController

  def index
    render 'lists/new'
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render 'lists/new'
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  
  def destroy
    @list = List.find_by(id: params[:id])
    @list.destroy
    redirect_to :root
  end

  private

  def list_params
    params.permit(:title).merge(user: current_user)
  end
end
