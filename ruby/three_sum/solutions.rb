# Problem: https://leetcode.com/problems/3sum/
# Time: O(n^2). Ruby's array sort uses quick sort which is O(nlogn)
# But later we go through the array N * (N - 1) times = N**2 - N
# Space: O(1)
def three_sum(nums)
    nums.sort!
    
    ans = []
    
    return ans if nums.size <= 2
    return ans if nums[0].positive?
    return [[0,0,0]] if nums[0].zero? && nums[-1].zero?
    
    (0..nums.size - 2).each do |index|
        next if nums[index] == nums[index - 1] && index.positive?
        lo = index + 1
        hi = nums.size - 1
        
        while lo < hi
            sum = nums[index] + nums[lo] + nums[hi]
            ans.append([nums[index], nums[lo], nums[hi]]) if sum.zero?
            lo += 1 if sum.zero? || sum.negative?
            
            hi -= 1 if sum.zero? || sum.positive?
            while nums[hi] == nums[hi + 1]; hi -= 1; end
            
        end
    end
    
    ans
end
