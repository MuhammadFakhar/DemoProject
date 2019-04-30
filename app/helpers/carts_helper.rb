module CartsHelper
  def calculate_total_amount(cart)
    total_amount = 0
    cart.each do |cart_item|
      total_amount +=((cart_item[1]["price"]).to_i*(cart_item[1]["quantity"]).to_i).to_i
    end
    total_amount
  end
end
