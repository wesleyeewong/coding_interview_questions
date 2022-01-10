# Time: O(n)
# Hash is constant time access, with one pass through of the array we'll be able to find solution
# Space: O(n)
# If solution is found on the last index, then all num will be put into the hash
def two_sum_hash(nums, target)
    hash = {}
    
    nums.each_with_index do |num, index|
        remaining = target - num
        
        return [hash[remaining], index] if hash.key?(remaining)
        
        hash[num] = index
    end
end

# Time: O(n^2)
# We'll need to pass through each element twice
# Space: O(1)
# Constant space used
def two_sum_brute_Force(nums, target)
  nums.each_with_index do |num, index|
    nums.each_with_index do |num2, index2|
      next if index == index2

      return [index, index2] if num + num2 = target
    end
  end
end

# Key concepts
# Use hash to save explored numbers
