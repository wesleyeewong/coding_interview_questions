# Time: O(n), Iterate through the String once
# Space: O(n)
# Use stack data structure, first in first last out checking
def is_valid(s)
    return false if s.size.odd?
    
    stack = []
    mapping = {
        "(" => ")",
        "[" => "]",
        "{" => "}"
    }
    
    s.each_char do |char|
        case char
            when "(", "[", "{"
            stack.unshift(char)
        else
            return false if mapping[stack[0]] != char
            stack.shift
        end
    end
    
    stack.empty?
end
