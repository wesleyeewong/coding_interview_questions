# Problem: https://leetcode.com/problems/product-of-array-except-self/
# Time: O(n), looping through once to get the products, then again to calculate the final product, so technically 2n
# Space: O(n), we're storing 2 results, technically again 2n
# My strategry is to store the products going forward, and backward
# Example:
# [2,3,4,5]
# forward = [2,2*3 = 6, 6*4 = 24, 24*5 = 120]
# backward = [5, 5*4 = 20, 20*3 = 60, 60*2 = 120]
#
# forward = [2,6,24]
# backward = [5,20,60]
#
# Once I have that I can prefill the first and the last result, then loop through again for the rest
#
# result = [
#   backward[-1], = 5 * 4 * 3
#   forward[index - 1] * backward[-(index + )], = forward[1 - 1] * backward[-(1 + 1)] = 2 * 20 = 2 * 4 * 5
#   forward[2 - 1] * backward[-(2 + 1)] = 6 * 5 = 2 * 3 * 5
#   forward[-1] = 2 * 3 * 4
# ]

def product_except_self(nums)
    size = nums.size
    output = Array.new(size)
    forward = [nums[0]]
    backward = [nums[-1]]
    
    nums.each_with_index do |num, index|
        next if index == 0
        break if index == nums.size - 1
        backwards_index = -(index + 1)
        forward.append(num * forward[-1])
        backward.append(nums[backwards_index] * backward[-1])
    end
    
    output[0] = backward[-1]
    output[-1] = forward[-1]
    
    (1...nums.size-1).each do |index|
        output[index] = forward[index - 1] * backward[-(index + 1)]
    end
    
    output
end

# Time: O(n), looping through once
# Space: O(1)
# Example:
# [2,3,4,5], lp = 1, rp = 1, output = [1,1,1,1]
# loop 1: [1,1,1,1] lp = 1 * 2, rp = 1 * 5
# loop 2: [1,2,5,1] lp = 1 * 2 * 3, rp = 1 * 5 * 4
# loop 3: [1,40,30,1] lp = 1 * 2 * 3 * 4, rp = 1 * 5 * 4 * 3
# loop 4: [120,40,30,24]

def product_except_self(nums)
    size = nums.size
    output = [1] * size
    left_product = 1
    right_product = 1

    (0...size).each do |index|
      backward_index = -index - 1

      output[index] *= left_product
      output[backward_index] *= right_product

      left_product *= nums[index]
      right_product *= nums[backward_index]
    end

    output
end
