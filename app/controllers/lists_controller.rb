class ListsController < ApplicationController
before_action :set_list, :only =>  [:show, :edit, :update, :destroy, :check]

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

  #def destroy
  #  @list.destroy
  #  redirect_to lists_url :notice => "Destroy Notice: 成功刪除！"
  #end
  def destroy
    if DateTime.current < set_list.due_date
      @list.destroy
      #用Flash來傳遞訊息。它的用處在於redirect時，能夠從這一個request傳遞文字訊息到下一個request，例如從destroy action傳遞「成功刪除」的訊息到index action。
      redirect_to lists_url, :notice => "Destroy Notice: 成功刪除！"
    else
      redirect_to lists_url, :alert => "Destroy Alert: OVERDUE! 無法刪除"
    end
  end





  def check
    @list.update(check: !(@list.check))
  end

  private
  def list_params
    params.require(:list).permit(:name, :due_date, :note, :check)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
