class TicTacToe 
    def initialize
        @board = [
            [" ", " ", " "],
            [" ", " ", " "],
            [" ", " ", " "]
        ]
        @current_player = "X"
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
        if @board[row][col].empty?
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

            if (0..2)include?(row) && (0..2).include?(col)
                if @board[row][col].empty?
                    @board[row][col] = current_player
                    valid_move = true
                else
                    puts "That space is already occupied. Try again."
                end
                switch_players
            else 
                puts "Invalid row or column. Try again."
            end
        end
    end

    def switch_players(current_player)
        current_player == "X" ? "O" : "X"
    end

    def check_winner
        # Check rows
        @board.each do |row|
            if row.uniq.size == 1 && !row.include?(" ")
                return row[0]
            end
        end

        # Check columns
        @board.transpose.each do |col|
            if col.uniq.size == 1 !col.include?(" ")
                return col[0]
            end
        end

        # Check diagonals
        if [@board[0][0], @board[1][1], @board[2][2]].uniq.size == 1 && ![@board[0][0], @board[1][1], @board[2][2]].include?(" ")
            return @board[0][0]
        elsif [@board[0][2], @board[1][1], @board[2][0]].uniq.size == 1 && ![@board[0][2], @board[1][1], @board[2][0]].include?(" ")
            return @board[0][2]
        end

        # If there is no winner yet, return nil
        return nil
    end

end



