class Api::V1::ProductsController < ApiController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

def index
    render json: { product: Product.all }
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