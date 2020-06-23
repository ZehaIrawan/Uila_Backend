class  Api::V1:: OrdersController < ApiController
  before_action :set_cart, only: [:show, :update, :destroy]

  # GET /carts
  def index
    @orders = current_user.orders

    render json: @orders
  end

  # GET /carts/1
  def show
    render json: @order
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
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @order= Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.fetch(:order, {})
    end
end
