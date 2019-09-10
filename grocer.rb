def consolidate_cart(cart)
  new_hash = {}
    cart.each do |item|
        if new_hash[item.keys[0]]
            new_hash[item.values[0]][:count] += 1
        else
        new_hash[item.keys[0]] = {
            price: item.values[0][:price],
            clearance: item.values[0][:clearance],
            count: 1
        }
        end
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
