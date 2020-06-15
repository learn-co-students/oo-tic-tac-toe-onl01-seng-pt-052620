require 'pry'

class TicTacToe

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
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
        puts " ----------- "
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts " ----------- "
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.length - @board.count(" ")
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    # def current_player
    #     if turn_count == 0
    #         "X"
    #     elsif turn_count.even? == true
    #         "X"
    #     else
    #         "O"
    #     end
    # end

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

# THIS IS WHAT I ORIGIONALLY CAME UP WITH
    #  def won?
    #      test = []
    #      WIN_COMBINATIONS.each do |winning_combo|
    #          test = winning_combo.collect do |space|
    #              @board[space]
    #          end
    #          if test.uniq.size == 1
    #              return winning_combo
    #          else
    #              false
    #          end
    #      end
    #      if test.size > 1
    #          false
    #      end
    #  end

# THIS IS THE SOLUTION THAT THE COACH HAD
     def won?
         WIN_COMBINATIONS.any? do |combo|
             if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                 return combo
             end
         end
     end

    def full?
        @board.all? { |space| space == "X" || space == "O" }
    end

    def draw?
        if won?.class != Array && full? == true
            true
        end
    end

    def over?
        if draw? == true || won?.class == Array
            true
        end
    end

    def winner
        if won?.class == Array
            @board[won?[0]]
        elsif over? == true
            nil
        end
    end

    def play
        until over? == true || won? != false
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        else
            nil
        end
    end

        # while over? == false
        #     puts "#{current_player} it is your turn."
        #     turn
        #     if draw?
        #         puts "Cat\'s Game!"
        #     end
        # end
        # if draw?
        #     puts "Cat's Game!"
        # elsif won?
        #     puts "Congratulations #{winner}!"
        # end


end

# until the game is over
#   take turns
# end
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it ended in a draw
# end

