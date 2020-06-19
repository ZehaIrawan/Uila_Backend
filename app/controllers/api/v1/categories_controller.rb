class Api::V1::CategoriesController < ApiController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index,:show]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def create
    if current_user.admin?
      @category = Category.new(:title => params[:title])
      if @category.save
        render json: @category
      else
        render json: { errors: @category.errors }
      end
    else
      render json:{errors:'You are not authorized'}
    end
  end

def index
  category = Category.all
    if category
      render json: category
    else
      render json: {error: "Could not find the category"}, status: 404
    end
end

def show
  productByCategory = Product.where(category_id: params[:id])
  if productByCategory
    render json: productByCategory
  else
    render json: {error: "Could not find the category"}, status: 404
  end
end


def destroy
  if current_user.admin?
    @category = Category.find(params[:id])
    @category.destroy!
    render json:{status:'Category has been deleted'}
  else
    render json:{errors:'You are not authorized'}
  end
end

private
def record_not_found(error)
  render json: { error: error.message }, status: :not_found
end
end