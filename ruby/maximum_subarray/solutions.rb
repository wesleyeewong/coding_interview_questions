# Problem: https://leetcode.com/problems/maximum-subarray/
# Time: O(n), Looping through the array once
# Space: O(1)
# Strategry: Keep track of the running total
# If running total turns negative we reset, because any preceeding negative numbers won't help with total
# And any preceeding positive numbers will automatically be larger
# We also kept track of max so we can reset the running total without worry
# Dumb man's kadane algorithm
#
# With DP, it's best to figure out the sub problem
def max_sub_array_first_try(nums)
    max = nums[0]
    running_total = nums[0]

    nums.each_with_index do |num, index|
        next if index == 0
        
        new_running_total = running_total + num
        new_running_total = num if running_total.negative?
        
        if num > new_running_total && num >= max
            max = num
            running_total = num
        elsif new_running_total > max
            max = new_running_total
            running_total = new_running_total
        elsif new_running_total <= max
            running_total = new_running_total
        end
    end
    max
end

# https://en.wikipedia.org/wiki/Maximum_subarray_problem
def max_sub_array_kadane_algo(nums)
  max = nums[0]
  running_total = nums[0]

  (1...nums.size).each do |index|
    num = nums[index]

    running_total = [num, running_total + num].max
    max = [running_total, max].max
  end

  max
end

# Time: O(n), looping through once
# Space: O(n), By storing the result in the cache
# By tabulation, you're solving the sub problems bottom up
# Hence, we specify the first solution as so cache = [nums[0]], then continually building upon it
def max_sub_array_dp_tabulation(nums)
  cache = [nums[0]]

  (1...nums.size).each do |index|
    cache[i] = [cache[index - 1 + nums[index], nums[index]].max
  end

  cache.max
end

# Time: O(n), still going through each element once
# Space: O(n), Caching
# By memoization, we're solvinng it top down
def max_sub_array_dp_memoization(nums)
  cache = []

  memoization_helper(cache, nums, num.size - 1)

  cache.max
end

def memoization_helper(cache, nums, index)
  num = nums[index]
  if index == 0
    cache[0] = num
    return num
  elsif cache[index]
    return cache[index]
  end

  cache[index] = [num, num + memoization_helper(cache, nums, index - 1) ].max
end
