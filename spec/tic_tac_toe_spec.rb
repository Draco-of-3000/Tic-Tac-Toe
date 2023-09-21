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
end

                

                

