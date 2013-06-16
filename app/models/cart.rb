class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  # 아래 add_product 메서드는 언뜻 보면 line_item.rb에 있어야 하는 것처럼 보인다. 
  # 그러나, line_item이 아닌 cart.rb에 있는 이유는 line_items_controller의 'create' 메서드의
  # current_cart.add_product(product.id) 처럼 cart가 이 메서드를 사용하기 때문이다.
  # 참고로 current_cart는 Cart.find(session[:cart_id])이런 식으로 시작한다.

  def add_product(product_id)
    current_item =  line_items.find_by_product_id(product_id) # 현재 품목. 품목 중에서 해당 product_id만 찾으면 된다.
    if current_item 
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end
end
