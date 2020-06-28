class  Api::V1:: OrdersController < ApiController
  before_action :set_cart, only: [:show, :update, :destroy]

  # GET /carts
  def index
    @orders = current_user.orders

    render json: @orders
  end

  # GET /carts/1
  def show
    render json: @order.to_json(:include => [:cart_items,:address])
  end

  # POST /carts
  def create
    @order= Order.new(order_params)
    @order.user_id = current_user.id

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    @order.address = Address.find(params[:address_id])
    if @order.save
      render json: @order.to_json(:include => :address)
    else
      render json: @order.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @order = Order.find(params[:id])
    if @order.id === current_user.current_order
      current_user.update(current_order: nil)
    end
    @order.destroy!
    render json: 'Order deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @order= Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.permit(:address_id)
    end
end
