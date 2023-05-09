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
end

board = TicTacToe.new
puts board.display_board

