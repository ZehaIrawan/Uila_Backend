class Api::V1::ProductsController < ApiController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

def index
    puts current_user.email
    render json: { user: current_user.email,product: Product.all, current_user: current_user.admin? }
end

def create
  if current_user.admin?
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      render json:@product
    else
      render json: { errors: @product.errors }
    end
  else
    render json:{errors:'You are not authorized'}
  end
end

def update
  if current_user.admin?
    @product = Product.find(params[:id])
    @product.update(product_params)
    render json:@product
  else
    render json:{errors:'You are not authorized'}
  end

end


private
  def product_params
    params.permit(:title, :description, :price)
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

end