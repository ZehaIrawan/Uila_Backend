class  Api::V1::CartItemsController < ApiController
  include CurrentCart
  before_action :set_cart_item, only: [:show, :update, :destroy]
  before_action :set_cart, only: [:create]

  # GET /cart_items
  def index
    @cart_items = CartItem.all

    render json: @cart_items
  end

  # GET /cart_items/1
  def show
    render json: @cart_item
  end

  def create
    @product = Product.find(params[:product_id])
    @cart_item = @cart.add_product(@product)

      if @cart_item.save
      render json:{p:'Product added to cart'}
      else
    render json:{p:'Failed add to cat'}
      end
  end


  # PATCH/PUT /cart_items/1
  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :cart_id)
    end
end
