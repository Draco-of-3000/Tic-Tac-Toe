class TicTacToe 
    @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @@count = 0

    def get_player_names
        puts "Welcome to Tic Tac Toe!"
        print "Player 1, please enter your name: "
        @player1_name = gets.chomp
        puts "Would you like to be X or O #{@player1_name}?"
        symbol1 = gets.chomp.upcase
        player_one = Players.new(player1, symbol1)
        print "Player 2, please enter your name: "
        @player2_name = gets.chomp
        symbol2 = player_one.symbol == "X" ? "O" : "X"
        player_two = Players.new(player2, symbol2)
        puts "\n"
        puts "Okay #{player_one.name}, you're up. Make a move."
        display_board
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

    def make_move(current_player)
        until @@count == 9

            puts "Pick a number from the grid above #{player_one.name}"
            move = gets.chomp.to_i - 1
            check_square(move, player_one, player_two)
            @@board[move] = player_one.symbol
            @@count += 1
            display_board

            puts "Pick a number from the grid above #{player_two.name}"
            move = gets.chomp.to_i - 1
            check_square(move, player_one, player_two)
            @@board[move] = player_two.symbol
            @@count += 1
            display_board
        end
    end

    def switch_players(current_player)
        @current_player = @current_player == "X" ? "O" : "X"
    end

    def check_winner
        # Check rows
        @board.each do |row|
            if row.uniq.size == 1 && !row.include?(" ")
                if row[0] == "X"
                    return @player1_name
                else 
                    return @player2_name
                end
            end
        end
    
        # Check columns
        @board.transpose.each do |col|
            if col.uniq.size == 1 && !col.include?(" ")
                if col[0] == "X"
                    return @player1_name
                else
                    return @player2_name
                end
            end
        end
    
        # Check diagonals
        if [@board[0][0], @board[1][1], @board[2][2]].uniq.size == 1 && ![@board[0][0], @board[1][1], @board[2][2]].include?(" ")
            if @board[0][0] == "X"
                return @player1_name
            else
                return @player2_name
            end

        elsif [@board[0][2], @board[1][1], @board[2][0]].uniq.size == 1 && ![@board[0][2], @board[1][1], @board[2][0]].include?(" ")
            if @board[0][2] == "X"
                return @player1_name
            else
                return @player2_name
            end
        end
    
        # If there is no winner yet, return nil
        return nil
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
newGame.play_game