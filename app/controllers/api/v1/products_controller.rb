class Api::V1::ProductsController < ApiController
  before_action :authenticate_user!

def index
    puts current_user.email
    render json: { user: current_user.email,product: Product.all, current_user: current_user.admin? }
end

def create
  # if current_user.admin?
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      render json:@product
    else
      render json: { errors: @product.errors }
    end
  # end
end


private
def product_params
    params.permit(:title, :description, :price)
  end
end