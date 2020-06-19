require 'pry'
class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2,],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn_count
    how_many_filled = 9 - @board.count(" ")
    how_many_filled
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter a number between 1 and 9!"
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      @board[index] = current_player
    else
      puts "Try again!"
      user_input = gets
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      combo_1 = combo[0]
      combo_2 = combo[1]
      combo_3 = combo[2]
      board_pos_1 = @board[combo_1]
      board_pos_2 = @board[combo_2]
      board_pos_3 = @board[combo_3]
      if board_pos_1 == board_pos_2 && board_pos_2 == board_pos_3 && position_taken?(combo_1)
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || if won?
      return true
    end
  end
end
