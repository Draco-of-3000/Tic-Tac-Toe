class TicTacToe 
    def initialize
        @board = [
            [" ", " ", " "],
            [" ", " ", " "],
            [" ", " ", " "]
        ]
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
end

board = TicTacToe.new
puts board.display_board

