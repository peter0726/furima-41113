class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]



  def index
    @items = Item.all

  end

  def new

  end


  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end



end
