class Game

	# attr_accessor :player_1, :player_2
	 
	 
	@@wins = 
    [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], 
     [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
	def initialize
		@player_1 = Player.new
		@player_2 = Player.new
		@grid = Board.new
		@current_turn = 1
		@winner = nil
	end

	def play
		new_players
		welcome_message
		@grid.print_grid
		play_now
		result
		game_over_message
	end


	def new_players

		puts "Enter your name, Player 1"
		@player_1.name = gets.chomp
		@player_1.sym = 'X'

		puts "Enter your name, Player 2"
		@player_2.name = gets.chomp
		@player_2.sym = 'O'
		
	end

	def welcome_message

		puts "WELCOME TO TIC-TAC-TOE, #{@player_1.name} and #{@player_2.name}"
		puts "#{@player_1.name}, you go first"



	end

	def play_now
		next_turn until game_over
	end

	def next_turn

		@current_turn.even? ? turn(@player_2) : turn(@player_1)

	end


	def turn(player)

		puts "Turn: #{@current_turn}  Player: #{player.name} Symbol: #{player.sym}"
		input = get_cell
		if @grid.update(input, player.sym)
			@current_turn+= 1
		else
			puts "Already taken. Try another"
		end
		@grid.print_grid
		check_win(player)

	end

	def get_cell
		input = nil
		until (0..8).include?(input)
			puts "Enter your move (1-9)"
			input = gets.chomp.to_i - 1
		end
		input
	end

	def check_win(player)
		@@wins.each do |x|
			@winner = player if x.all? {|a| @grid.board[a] == player.sym}
		end
	end

	def game_over
    	@current_turn > 9 || @winner
  	end

  	def result

  		if @current_turn > 9 && !@winner
  			puts "TIE IT IS"
  		else
  			puts "#{@winner.name}, YOU WIN!!! CONGRATS!!!"
  		end
  	end

  	def game_over_message
  		puts "GAME OVER"
  	end


	class Board

		attr_reader :board, :empty
		def initialize
			@empty = '-'
			@board = Array.new(9, @empty)

		end

		def print_grid
			puts "\n"
			@board.each_slice(3){|cell| puts cell.join(' | ')}
			puts "\n"
		end

		def update(input, symbol)
			if @board[input] == @empty
				@board[input] = symbol
				return true
			else
				return false
			end
		end


	end



	


	Player = Struct.new(:name, :sym)
end



my_game = Game.new
my_game.play