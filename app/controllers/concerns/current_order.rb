module CurrentOrder

  private

    def set_cart
      if current_user.current_order.nil?
        @order = current_user.orders.create!
        current_user.update(current_order: @order.id)
      else
      @order =  Order.find(current_user.current_order)
      end
    end

end