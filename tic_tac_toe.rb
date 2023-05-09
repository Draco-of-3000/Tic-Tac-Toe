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
            else 
                puts "Invalid row or column. Try again."
            end
        end
    end

    def switch_players(current_player)
        current_player == "X" ? "O" : "X"
    end
end

board = TicTacToe.new
puts board.display_board

