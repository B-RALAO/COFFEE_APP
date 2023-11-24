class PurchasesController < ApplicationController
  before_action :set_coffee, only: %i[create new]
  before_action :set_user, only: %i[create new]

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:coffee_id])
  end

  def new
    # @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = @user
    @purchase.coffee = @coffee
    respond_to do |format|
      if @purchase.save
        format.turbo_stream { redirect_to coffee_purchase_path(@purchase.id, @purchase.coffee.id) }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace('purchase-form', partial: "purchases/form",
          locals: { purchase: @purchase, coffee: @coffee })
        }
      end
    end
  end

  private

  def set_coffee
    @coffee = Coffee.find(params[:coffee_id])
  end

  def set_user
    @user = current_user
  end

  def purchase_params
    params.require(:purchase).permit(:quantity, :status)
  end
end
