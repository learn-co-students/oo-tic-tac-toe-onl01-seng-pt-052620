require 'pry'

class TicTacToe
  attr_accessor :board, :game

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
  @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string_integer = string.to_i
    string_integer = string_integer - 1
  end

  def move(location,player)
    board[location] = player
  end

  # def position_taken?(index)
  #   board[index] != (" ") 
  # end

  def position_taken?(index)
    if board[index] == "" || board[index] == " " || board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    index.between?(0, 8) && board[index] == " "   
  end

  def turn_count
    spaces = []
    spaces = board.select do |space| space != (" ")
    end
    spaces.length
  end

  def current_player
    spaces_count = []
    spaces_count = board.select {|space| space != (" ")}
    # spaces_played = game.turn_count
    # binding.pry
    if spaces_count.length.even?
      return "X" 
    elsif spaces_count.length.odd?
      return "O" 
    end

  end

  def turn
    puts "Please enter a number 1 - 9"
    player_input = gets.strip
    player_index = input_to_index(player_input)
    # binding.pry
    if valid_move?(player_index)
      board[player_index] = current_player
    else
      turn
    end
    display_board

  end

  def won?

    WIN_COMBINATIONS.detect do |comb|
      position_taken?(comb[0]) && board[comb[0]] == board[comb[1]] && board[comb[1]] == board[comb[2]]
    end

  end

  def full?
    board.all? {|i| i == "X" || i == "O"}
 end

 def draw?
  if won?
    return false
  elsif full? == false
    return false
  else
    return true
  end
 end

 def over?
  if won? || draw? == true
    return true
  else
    return false
  end
 end

 def winner
  winning_array = won?
  if winning_array
    return board[winning_array[0]]
  end
 end

 def play
  while over? == false
    turn
  end
  
  if draw?
    puts "Cat's Game!"
  elsif winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  end
 end



end