# Problem: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
# Time: O(n), looping through the array just once
# Space: O(1)
def max_profit(prices)
    min = prices[0]
    max = prices[0]
    max_profit = max - min
    
    
    prices.each do |price|
        if price < min
            min = price
            max = price
        elsif price > max
            max = price
            max_profit = max - min if max - min > max_profit
        end
    end
    
    max_profit
end
