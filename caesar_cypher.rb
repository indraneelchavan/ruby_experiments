

def caesar(txt, shift = 0)
	small_alpha_array = [*('a'..'z')]
	cap_alpha_array = [*('A'..'Z')]
	new_txt=""
	txt.each_char do |t|
		ind = 0
		if small_alpha_array.include?(t)
			
			ind = small_alpha_array.index(t)
			ind = ind - (26 - shift)
			t = small_alpha_array[ind]
			new_txt = new_txt + t
		elsif cap_alpha_array.include?(t)
			
			ind = cap_alpha_array.index(t)
			ind = ind - (26 - shift)
			t = cap_alpha_array[ind]
			new_txt = new_txt + t
		else 
			t = " "
			new_txt = new_txt + t
		end
end
	print "Here's your encoded message: #{new_txt}"
end

print "Enter the secret message that you want to encode: "
txt_input = gets.chomp
print "Enter the 'shift': "
shift = gets.chomp.to_i
caesar(txt_input,shift)