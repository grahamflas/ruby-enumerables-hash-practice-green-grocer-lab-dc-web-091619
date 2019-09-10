# cart = [
#   {"AVOCADO" => {:price => 3.00, :clearance => true }},
#   {"AVOCADO" => {:price => 3.00, :clearance => true }},
#   {"KALE"    => {:price => 3.00, :clearance => false}}
# ]

def consolidate_cart(cart)
    new_hash = Hash.new

    #An array of hashes is being passed in as an argument for `cart`
    #We want to add each element of the array to `new_hash` along wtih a new `:count` key-value pair
    #If there are duplicate items, updated the `count`

    cart.each do |item|
        # the `.keys` method returns an array.  Use this to grab the name of the item and add it to the new hash
        #check to see if `new_hash[item.keys[0]]` is truthy. If it is, it is a duplicate item and we need to increment the count.
        if new_hash[item.keys[0]]
            new_hash[item.keys[0]][:count] += 1
        else
            #adds the key to the item hash as a new key to `new_hash`
            #the value of the item hash is also a hash, so use `.values` method to target `price` and `clearance`
            new_hash[item.keys[0]] = {
                price: item.values[0][:price],
                clearance: item.values[0][:clearance],
                count: 1
            }
        end
    end
    new_hash
end

# cart = {
#   "AVOCADO" => {:price => 3.00, :clearance => true, :count => 3},
#   "KALE"    => {:price => 3.00, :clearance => false, :count => 1}
# }

# coupons =
#     [
#       {:item => "AVOCADO", :num => 2, :cost => 5.00},
#       {:item => "BEER", :num => 2, :cost => 20.00},
#       {:item => "CHEESE", :num => 3, :cost => 15.00}
#     ]


def apply_coupons(cart, coupons)

    coupons.each do |coupon|

        if (cart.keys).include? coupon[:item]

            if cart[coupon[:item]][:count] >= coupon[:num]
                item_with_coupon = "#{coupon[:item]} W/COUPON"

                if cart[item_with_coupon]
                    cart[item_with_coupon][:count] += coupon[:num]

                else
                  cart[item_with_coupon] = {
                      price: coupon[:cost] / coupon[:num],
                      clearance: cart[coupon[:item]][:clearance],
                      count: coupon[:num]
                  }
                end

                cart[coupon[:item]][:count] -= coupon[:num]
            end
        end
    end

    cart
end

def apply_clearance(cart)
    cart.keys.each do |item|
        if cart[item][:clearance]
           price = cart[item][:price]
           price = (price * 0.8).round(2)
        end
    end
    cart
end

def checkout(cart, coupons)
  # code here
end
