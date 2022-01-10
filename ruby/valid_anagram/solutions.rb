# Problem: https://leetcode.com/problems/valid-anagram/submissions/
# Time: O(n): loopoing through the string once
# Space: O(n)
def is_anagram_hash(s, t)
    return false if s.size != t.size
    
    hash = Hash.new(0)
    
    (0...s.size).each do |index|
        hash[s[index]] += 1
        hash[t[index]] -= 1
        
        hash.delete(t[index]) if hash[t[index]] == 0
        hash.delete(s[index]) if hash[s[index]] == 0
    end

    hash.size == 0
end

# Time: O(sorting)
# Space: O(1)
def is_anagram_sort(s, t)
  s.chars.sort == t.chars.sort
end
