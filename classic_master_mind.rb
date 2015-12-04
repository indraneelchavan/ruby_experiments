class Game


	def initialize

		@code = Board.new
		@try_counter = 1
		@guess_array = []
		@winner_flag = false
		@intersection = []
		@display_array = []
	end



	def start_playing

		player_name
		@code.set_code
		
		start_guessing
		# guess

	end


	def player_name

		puts "Hello human. What is thou name?"
		@player = gets.chomp
		puts "\n"
		puts "Good. I have set the code for you #{@player}."
		puts "Start guessing. 10 tries is what you've got"
	end


	def start_guessing

		guess until game_over

		if game_over & !@winner_flag
			loser_message
		end
	end

	def guess
		
		@black_peg = 0
		@white_peg = 0
		@current_guess = nil 
		puts "\n"
		puts "Guess number #{@try_counter}. (Enter 4 numbers between 1-6 separated by spaces)"
		puts "\n"
		@current_guess = gets.chomp


		turn_to_array(@current_guess)

		if !check_valid(@guess_array)
			puts "Invalid input. Confirm that it is 4 numbers that you are entering and that too between 1 and 6). Go again!"	
			# @guess_array = []
			# @current_guess = nil
			start_guessing
		end		
		
		@black,@white = compare_with_code(@guess_array,@code.new_code)

		# puts "#{@black} and #{@white}"
		# print @guess_array
		
		feedback(@guess_array, @black, @white)
		@try_counter += 1

	end

	
	def check_valid(guess)

		if guess.any? {|x| x > 6}
			return false
		elsif guess.length > 4
				return false
		else
			return true
		end

	end




	def turn_to_array(guess)

		@guess_array = guess.split(' ')
		@guess_array.map! do |x|
			x.to_i
		end
		return @guess_array

	end

	def compare_with_code(guess_array,new_code)
		@temp_guess_array = []
		@temp_code_array = []
		# puts new_code
		guess_array.each do |x| 
			@temp_guess_array.push(x)
		end

		new_code.each do |x| 
			@temp_code_array.push(x)
		end

		if guess_array == new_code
			winner

		end

		for index in (0..3)
			if guess_array[index] == new_code[index]
				@black_peg += 1
				@temp_guess_array[index] = nil
				@temp_code_array[index] = nil
			end 
		end
		# puts @black_peg
		# print @temp_guess_array

		@white_peg = same_color(@temp_guess_array,@temp_code_array)

		return @black_peg,@white_peg



	end


	def matched(array, index)

		# @black_peg += 1
		@temp_value = array[index]
		array.map! {|val| val == @temp_value ? nil : val}
		

		return array


	end

	def same_color(array, new_code)

		@intersection = array & new_code
		@intersection.compact! 
		@white_peg =  @intersection.length

		return @white_peg

	end

	def feedback(arr, black, white)
		@feed_arr = []

		arr.each do |x| 
			@feed_arr.push(x)
		end

		black.times do
			@feed_arr.push('x')
		end

		white.times do
			@feed_arr.push('o')
		end
		@display_array << @feed_arr

		puts "-----------------------------------------"
		puts "Grid after try #{@try_counter}\n"
		@display_array.each{|x| print "\n#{x}\n"}
		puts "-----------------------------------------"

	end

	def game_over

		if @try_counter > 10 || @winner_flag == true
			return true
		end


	end

	def winner

		
		puts "\n"
		puts "----------------------------------------------------------------------------------------"
		puts "YOU DID IT #{@player.upcase}. YOU NEEDED #{@try_counter} TRIES TO BREAK THE CODE. THAT'S AWESOME!!"
		puts "----------------------------------------------------------------------------------------"
		@winner_flag = true

	end

	def loser_message
		puts "\n"
		puts "---------------------------------------------------------------------------------------------------------------"
		puts "THATS'S 10 TRIES AND YOU COULDN'T DO IT. YOU LOST! NOT EASY TO BREAK MY CODE, EH? BTW MY CODE WAS #{@code.new_code}"
		puts "---------------------------------------------------------------------------------------------------------------"
	end




	class Board

		attr_accessor :new_code

		def set_code
			@new_code = Array.new(4) 
			@new_code.map! do |x|
				x = rand(1..6)
			end
			# print @new_code
			return @new_code

		end


	end



end

my_game = Game.new
my_game.start_playing