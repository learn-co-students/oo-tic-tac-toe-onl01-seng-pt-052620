require 'pry'

class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [0,4,8],
        [2,5,8],
        [6,4,2],
        [1,4,7]
    ]

    attr_reader :board

    def initialize
        @board = []
        i = 0
        while i < 9
            @board[i] = " "
            i += 1
        end
        @board = Array.new(9, " ")
    end

    def display_board
        puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
        puts ("-----------")
        puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
        puts ("-----------")
        puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
    end

    def input_to_index(x)
        @index = x.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count { |space| space == "X" || space == "O" }
    end

    def current_player
        
    end

    def turn
        input = gets.strip
        index = input_to_index(input)
        if input == (1...9)
            
        end
    end

    def won?

    end

    def full?

    end

    def draw?

    end

    def over?

    end

    def winner

    end
end