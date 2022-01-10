# Time: O(n), pass through array once
# Space: O(n), store num once each
def contains_duplicate_set(nums)
    set = Set.new
    
    nums.each do |num|
        return true if set.include?(num)
        
        set.add(num)
    end
    
    false
end

# Time: O(what .uniq takes)
# Space: O(n), creating new array object from .uniq
def contains_duplicate_ruby(nums)
  nums.uniq != nums
end
