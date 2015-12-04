def stock_picker(arr)
	next_arr = []
	day_hold =[]
	max_diff = 0
	arr.each_index do |i|
		next_arr = arr[i,arr.length]

		max_temp = next_arr.max
		temp_diff = max_temp - arr[i]
		if max_diff < temp_diff
			max_diff = temp_diff
			day_hold = [i+1,i + next_arr.index(max_temp)+1]
		end 	
	end
	print "You shall make a profit of Rs.#{max_diff} if you buy on day #{day_hold[0]} and sell on day #{day_hold[1]} "
end

puts "Enter stock prices. One for each day, separated by a comma: "
user_prices = gets.chomp.split(',').map { |price| price.to_i }
stock_picker(user_prices)