class ListsController < ApplicationController
before_action :set_list, :only =>  [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new #秀出create頁面
    @list = List.new
  end

  def create #執行Create動作
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_url
    else
      render :action => :new
    end
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to lists_path
    else
      render :action => :new
    end
  end

  def destroy
    @list.destroy

    redirect_to lists_path
  end



  private
  def list_params
    params.require(:list).permit(:name, :due_date, :note,)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
