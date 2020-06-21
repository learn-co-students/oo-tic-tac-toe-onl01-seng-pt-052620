require 'pry'

class TicTacToe

    attr_reader :board

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} " 
        puts " ----------- "
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts " ----------- "
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token="X")
        board[index] = token
    end

    def position_taken?(index)
        board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        board.length - board.count(" ")
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please move by choosing a number from 1-9."
        loop do
            this_move = input_to_index(gets.strip)
            if valid_move?(this_move) == true
                move(this_move, current_player)
                display_board
                break
            else
                puts "That move was not valid. Please enter a number from 1-9."
            end
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
                return combo
            end
        end
    end

    def full?
        board.all? { |space| space == "X" || space == "O" }
    end

    def draw?
        full? && !won?
    end

    def over?
        !!won? || draw?
    end

    def winner
        if won?.class == Array
            board[won?[0]]
        elsif over? == true
            nil
        end
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
    end
    
end