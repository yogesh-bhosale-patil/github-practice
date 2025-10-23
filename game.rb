# /workspaces/github-practice/game.rb
# Simple terminal Tic-Tac-Toe game loop

WIN_LINES = [
    [0,1,2], [3,4,5], [6,7,8],    # rows
    [0,3,6], [1,4,7], [2,5,8],    # cols
    [0,4,8], [2,4,6]              # diagonals
].freeze

def display_board(board)
    cells = board.map.with_index do |v, i|
        v.nil? ? (i + 1).to_s : v
    end
    puts
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "---+---+---"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "---+---+---"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts
end

def winner(board)
    WIN_LINES.each do |a,b,c|
        next if board[a].nil?
        return board[a] if board[a] == board[b] && board[b] == board[c]
    end
    nil
end

def board_full?(board)
    board.none?(&:nil?)
end

def valid_move?(board, idx)
    idx.between?(0,8) && board[idx].nil?
end

def prompt_move(player, board)
    loop do
        print "Player #{player}, enter move (1-9) or q to quit: "
        input = STDIN.gets&.chomp
        exit if input == 'q'
        if input =~ /^[1-9]$/
            idx = input.to_i - 1
            return idx if valid_move?(board, idx)
            puts "That square is already taken."
        else
            puts "Please enter a number 1-9."
        end
    end
end

def play_game
    board = Array.new(9, nil)
    current = 'X'
    loop do
        display_board(board)
        idx = prompt_move(current, board)
        board[idx] = current
        if (win = winner(board))
            display_board(board)
            puts "Player #{win} wins!"
            break
        elsif board_full?(board)
            display_board(board)
            puts "It's a draw."
            break
        else
            current = (current == 'X' ? 'O' : 'X')
        end
    end
end

# Top-level loop: play again option
loop do
    play_game
    print "Play again? (y/n): "
    ans = STDIN.gets&.chomp&.downcase
    break unless ans == 'y'
end

puts "Thanks for playing."