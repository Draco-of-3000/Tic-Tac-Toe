class TicTacToe 
    @@board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @@count = 0
    @current_player = " "

    def get_player_names
        puts "Welcome to Tic Tac Toe!"
        print "Player 1, please enter your name: "
        @player1_name = gets.chomp
        puts "Would you like to be X or O #{@player1_name}?"
        symbol1 = gets.chomp.upcase
        player_one = Players.new(@player1_name, symbol1)
        print "Player 2, please enter your name: "
        @player2_name = gets.chomp
        symbol2 = player_one.symbol == "X" ? "O" : "X"
        player_two = Players.new(@player2_name, symbol2)
        puts "\n"
        puts "Okay #{player_one.name}, you're up. Make a move."
        display_board
        make_move(player_one, player_two)
    end

    def display_board
        puts "  #{@@board[0]}  |  #{@@board[1]}  |  #{@@board[2]}"
        puts seperator = "-----+-----+-----"
        puts "  #{@@board[3]}  |  #{@@board[4]}  |  #{@@board[5]}"
        puts seperator
        puts "  #{@@board[6]}  |  #{@@board[7]}  |  #{@@board[8]}"
        puts "\n"
    end

    def update_board(move, player_one, player_two)
        if @@board[move] == player_one.symbol || @@board[move] == player_two.symbol
            puts "That number is taken, pick another!"
            move = gets.chomp.to_i - 1
        else
            return
        end
    end

    def make_move(player_one, player_two)
        until @@count == 9

            puts "Pick a number from the grid above #{player_one.name}"
            move = gets.chomp.to_i - 1
            update_board(move, player_one, player_two)
            @@board[move] = player_one.symbol
            @@count += 1
            display_board
            return if check_winner(player_one)

            switch_players(@current_player)

            puts "Pick a number from the grid above #{player_two.name}"
            move = gets.chomp.to_i - 1
            update_board(move, player_one, player_two)
            @@board[move] = player_two.symbol
            @@count += 1
            display_board
            return if check_winner(player_two)

            switch_players(@current_player)
        end
    end

    def switch_players(current_player)
        @current_player = @current_player == "X" ? "O" : "X"
    end

    def check_winner(player)
        winning_combinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],  # rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8],  # columns
            [0, 4, 8], [2, 4, 6]              # diagonals
        ]
        
        winning_combinations.each do |combination|
            if combination.all? { |index| @@board[index] == player.symbol }
              return true
            end
        end
        
        false
    end

    def play_game 
        get_player_names
        display_board

        winner = nil
        until winner || board_full?
            make_move(@current_player)
            display_board
            winner = check_winner
            switch_players
        end

        if winner
            puts "#{winner} is the winner!"
        else
            puts "It's a tie!"
        end
    end
    
    def board_full?
        @board.flatten.none?(&:empty?)
    end
end

class Players
    attr_accessor :name, :symbol
    def initialize (name, symbol)
        @name = name
        @symbol = symbol
    end
end


newGame = TicTacToe.new 
newGame.get_player_names