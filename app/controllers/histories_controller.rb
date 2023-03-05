class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @history_shipping = HistoryShipping.new
  end

  def create
    @history_shipping = HistoryShipping.new(history_params)
    if @history_shipping.valid?
      pay_item
      @history_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.history.present?
  end

  def history_params
    params.require(:history_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end
end
