require './lib/tic_tac_toe'

describe TicTacToe do
    let(:player_one) { Players.new("Player1", "X") }
    let(:player_two) { Players.new("Player2", "O") }
    subject(:game) { described_class.new }

    before do
        allow(game).to receive(:gets).and_return("Player1", "X", "Player2", "O")
    end

    describe '#check_winner' do
        context 'when there is a winner' do
            it 'returns true when X wins in the top row' do
               game.instance_variable_set(:@board, ["X", "X", "X", "4", "5", "6", "7", "8", "9"])
               expect(game.check_winner(player_one)).to be true
            end

            it 'returns true when X wins in a row (second row)' do
                game.instance_variable_set(:@board, ["O", "X", "O", "X", "X", "X", "7", "8", "9"])
                expect(game.check_winner(player_one)).to be true
            end

            it 'returns true when X wins in a row (bottom row' do
                game.instance_variable_set(:@board, ["1", "2", "3", "4", "5", "6", "X", "X", "X"])
                expect(game.check_winner(player_one)).to be true
            end

            it 'returns true when X wins in a column (leftmost)' do
                game.instance_variable_set(:@board, ["X", "2", "O", "X", "5", "O", "X", "8", "9"])
                expect(game.check_winner(player_one)).to be true
            end
        
            it 'returns true when X wins in a column (middle)' do
                game.instance_variable_set(:@board, ["O", "X", "O", "4", "X", "6", "7", "X", "9"])
                expect(game.check_winner(player_one)).to be true
            end
        
            it 'returns true when X wins in a column (rightmost)' do
                game.instance_variable_set(:@board, ["O", "2", "X", "O", "5", "X", "7", "8", "X"])
                expect(game.check_winner(player_one)).to be true
            end

            it 'returns true when X wins diagonally (top left to bottom right)' do
                game.instance_variable_set(:@board, ["X", "2", "O", "4", "X", "O", "7", "8", "X"])
                expect(game.check_winner(player_one)).to be true
            end
        
            it 'returns true when X wins diagonally (top right to bottom left)' do
                game.instance_variable_set(:@board, ["O", "2", "X", "4", "X", "O", "X", "8", "7"])
                expect(game.check_winner(player_one)).to be true
            end

            it 'returns true when O wins in the top row' do
                game.instance_variable_set(:@board, ["O", "O", "O", "4", "5", "6", "7", "8", "9"])
                expect(game.check_winner(player_two)).to be true
             end
 
            it 'returns true when O wins in a row (second row)' do
                game.instance_variable_set(:@board, ["X", "O", "X", "O", "O", "O", "7", "8", "9"])
                expect(game.check_winner(player_two)).to be true
            end
 
            it 'returns true when O wins in a row (bottom row' do
                game.instance_variable_set(:@board, ["1", "2", "3", "4", "5", "6", "O", "O", "O"])
                expect(game.check_winner(player_two)).to be true
            end
 
            it 'returns true when O wins in a column (leftmost)' do
                game.instance_variable_set(:@board, ["O", "2", "X", "O", "5", "O", "O", "8", "9"])
                expect(game.check_winner(player_two)).to be true
            end
         
            it 'returns true when O wins in a column (middle)' do
                game.instance_variable_set(:@board, ["X", "O", "X", "4", "O", "6", "7", "O", "9"])
                expect(game.check_winner(player_two)).to be true
            end
         
            it 'returns true when O wins in a column (rightmost)' do
                game.instance_variable_set(:@board, ["X", "2", "O", "O", "5", "O", "7", "8", "O"])
                expect(game.check_winner(player_two)).to be true
            end
 
            it 'returns true when O wins diagonally (top left to bottom right)' do
                game.instance_variable_set(:@board, ["O", "2", "X", "4", "O", "X", "7", "8", "O"])
                expect(game.check_winner(player_two)).to be true
            end
         
            it 'returns true when O wins diagonally (top right to bottom left)' do
                game.instance_variable_set(:@board, ["X", "2", "O", "4", "O", "O", "O", "8", "7"])
                expect(game.check_winner(player_two)).to be true
            end
        end
    end

    describe '#update_board' do
        let(:player1) { Players.new("Player 1", "X") }
        let(:player2) { Players.new("Player 2", "O") }
        let(:game) { described_class.new }

        context 'when a move is taken' do
            before do
                move = 0
                game.instance_variable_set(:@board, ["X", "2", "3", "4", "5", "6", "7", "8", "9"])
                game.update_board(move, player1, player2)
            end

            it 'does not update the board when the move is already taken' do
                updated_board = game.instance_variable_get(:@board)
                expect(updated_board).to eq(["X", "2", "3", "4", "5", "6", "7", "8", "9"])
            end
        end
        

        context 'when the move is not taken' do
            before do
                move = 2
                game.instance_variable_set(:@board, ["1", "O", "3", "4", "5", "6", "7", "8", "9"])
                game.update_board(move, player1, player2)
            end
        
            it 'updates the board correctly' do
                updated_board = game.instance_variable_get(:@board)
                expect(updated_board).to eq(["1", "O", "3", "4", "5", "6", "7", "8", "9"])
            end
        end
    end

    describe '#switch_players' do
        subject { game.instance_variable_get(:@current_player) }

        context 'when the current player is "X"' do
            before { game.instance_variable_set(:@current_player, "X") }

            it 'changes current player from "X" to "O"' do
                expect(game.switch_players(@current_player)).to eq("O")
            end
        end

        context 'when the current player is "O"' do
            before { game.instance_variable_set(:@current_player, "O") }

            it 'changes current player from "O" to "X"' do
                expect(game.switch_players(@current_player)).to eq("X")
            end
        end
    end

    describe '#make_move' do
        subject(:game) { described_class.new }

        before do
            allow(game).to receive(:gets).and_return("Player1", "X", "Player2", "O")
        end

        context 'when the game ends in a tie' do
            before do
                game.instance_variable_set(:@board, ["X", "O", "X", "X", "X", "O", "O", "X", "O"])
                game.instance_variable_set(:@count, 8)
            end
          
            it 'displays "It\'s a tie!"' do
              allow(game).to receive(:gets).and_return("3\n", "7\n", "4\n", "6\n", "5\n", "8\n", "1\n", "9\n")
              expect { game.make_move(player_one, player_two) }.to output("It's a tie!\n").to_stdout
            end
        end

        context 'when an out-of-bounds move is made' do
            it 'returns false' do
              game.instance_variable_set(:@board, ["1", "2", "3", "4", "5", "6", "7", "8", "9"])
              move = 10 
              result = game.valid_move(move)
              expect(result).to be(false)
            end
        end
    end
end