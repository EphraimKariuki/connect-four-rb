require_relative 'board'
require_relative 'player'
class Game
    attr_reader :board, :player1, :player2  
    def initialize(player1, player2)
      @board = Board.new
      @player1 = player1
      @player2 = player2
      @current_player = player1
      @winner = nil
    end
    def play
      puts "Welcome to Connect Four!"
      puts "Player 1: #{@player1.name}"
      puts "Player 2: #{@player2.name}"
      puts "Player 1 is red, Player 2 is yellow"
      puts "To play, type in the number of the column you want to drop your"
      puts "piece in"
      puts "A player wins by connecting four of their colored piece"
      puts "in a row - vertically, horizontally or diagonally"
      puts "Good luck!"
      
      play_round
      
    end
      
    def play_round
      while @winner.nil?
        @board.display
        player_move
        check_winner
        switch_player
      end
      @board.display
      puts "Game over"
      puts "The winner is #{winner.name}"
    end 
  
    def player_move
      puts "It's #{@current_player.name}'s turn"
      puts "Enter a column number to drop your piece"
      input = gets.chomp.to_i - 1
      available_moves = @board.available_moves 
      if available_moves.include?(input.to_i)
         @board.place_piece(input.to_i, @current_player.color)
      else
        puts "Invalid move, please try again"
        player_move
      end
      # @board.display
    end
  
    def switch_player
      @current_player = @current_player == @player1 ? @player2 : @player1
    end  
    def check_winner 
      if @board.win?(@current_player.color)
        puts "#{@current_player.name} wins!"
        @winner = @current_player
        return
      end
    end  
  end
  
  
  
  
  
  