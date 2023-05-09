class TicTacToe 
    def initialize
        @board = [
            [" ", " ", " "],
            [" ", " ", " "],
            [" ", " ", " "]
        ]
        @player1_name = ""
        @player2_name = ""
        @current_player = ""
    end

    def get_player_names
        puts "Welcome to Tic Tac Toe!"
        print "Player 1, please enter your name: "
        @player1_name = gets.chomp
        print "Player 2, please enter your name: "
        @player2_name = gets.chomp
        @current_player = [@player1_name, @player2_name].sample
         make_move(@current_player)
    end

    def display_board
        puts "   0  1  2"
        puts " ------------"
        @board.each_with_index do |row, i|
            print "#{i} |"
            row.each do |space|
                print "#{space} |"
            end
            puts "\n ------------"
        end
    end

    def update_board(row, col, current_player)
        if @board[row][col] == " "
            @board[row][col] = current_player
            return true
        else
            return false
        end
    end

    def make_move(current_player)
        valid_move = false 
    
        until valid_move
          puts "Player #{current_player}, enter your move (row, col):"
          move = gets.chomp.split(",")
          row, col = move[0].to_i, move[1].to_i
    
          if (0..2).include?(row) && (0..2).include?(col)
            if update_board(row, col, current_player)
              valid_move = true
            else
              puts "That space is already occupied. Try again."
            end
          else 
            puts "Invalid row or column. Try again."
          end
        end
        switch_players
    end

    def switch_players
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
        @board.flatten.none? { |space| space == ' ' }
    end
end


newGame = TicTacToe.new 
newGame.play_game
