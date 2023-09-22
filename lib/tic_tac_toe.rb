class TicTacToe 
    def initialize
        @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        @count = 0
        @current_player = " "
    end

    def get_player_names
        puts "Welcome to Tic Tac Toe!"
        print "Player 1, please enter your name: "
        @player1_name = gets.chomp
        puts "Would you like to be X or O #{@player1_name}?"
        symbol1 = gets.chomp.upcase

        until symbol1 == "X" || symbol1 == "O"
            puts "Invalid symbol. Please enter 'X' or 'O':"
            symbol1 = gets.chomp.upcase
        end

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
        puts "  #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}"
        puts seperator = "-----+-----+-----"
        puts "  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}"
        puts seperator
        puts "  #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}"
        puts "\n"
    end

    def update_board(move, player_one, player_two)
        if @board[move] == player_one.symbol || @board[move] == player_two.symbol
            puts "That number is taken, pick another!"
            move = gets.chomp.to_i - 1
        else
            return
        end
    end

    def make_move(player_one, player_two)
        while @count < 9
            if @count == 8
                puts "It's a tie!"
                return
            end

            puts "Pick a number from the grid above #{player_one.name}"
            move = gets.chomp.to_i - 1

            if !valid_move
                puts "Invalid input. Please enter a number between 1 and 9."
                next
            end

            update_board(move, player_one, player_two)
            @board[move] = player_one.symbol
            @count += 1
            display_board
            if check_winner(player_one)
                puts "#{player_one.name} wins!"
                return
            end

            if valid_move
                switch_players(@current_player)
            end 

            puts "Pick a number from the grid above #{player_two.name}"
            move = gets.chomp.to_i - 1

            if !valid_move
                puts "Invalid input. Please enter a number between 1 and 9."
                next
            end

            update_board(move, player_one, player_two)
            @board[move] = player_two.symbol
            @count += 1
            display_board
            if check_winner(player_two)
                puts "#{player_two.name} wins!"
                return
            end
            switch_players(@current_player)
        end
    end

    def valid_move(move)
        move.to_i.between?(1, 9)
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
            if combination.all? { |index| @board[index] == player.symbol }
              return true
            end
        end
        
        false
    end
end

class Players
    attr_accessor :name, :symbol
    def initialize (name, symbol)
        @name = name
        @symbol = symbol
    end
end
