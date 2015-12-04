dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substring(user_string, dictionary)
result = {}
word_array = user_string.downcase.split(" ")

cnt = 0
user_string = user_string.downcase
dictionary.each do |x|
	word_array.each do |w|
		if w.include?(x)
			cnt = cnt + 1
			result.has_key?(x) ? result[x] += 1 : result[x] = 1
		end
	end
end
print result
end

print "Enter a string to match the dictionary substrings: "
word_string = gets.chomp
substring(word_string, dictionary)