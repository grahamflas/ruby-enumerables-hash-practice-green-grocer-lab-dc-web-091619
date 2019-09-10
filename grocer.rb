def consolidate_cart(cart)
    new_hash = Hash.new

    cart.each do |item|
        new_hash[item.keys[0]] = {
            price: item.values[0][:price],
            clearance: item.values[0][:clearance],
            count: 1
        }
    end
    new_hash
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
