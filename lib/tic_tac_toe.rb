require 'pry'

#main game class
class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(string)
    user_input = string.to_i - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else 
      false
    end 
  end 
  
  def valid_move?(position)
    if (0..8).include?(position) && @board[position] == " "
      true
    else
      false 
    end 
  end 
  
  def turn_count
    @board.count {|item| item == "X" || item == "O"}
  end 
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end 
  end 
  
  def turn
    puts "Your turn! Pick your square; 1-9!"
    user_input = gets.chomp
    index = input_to_index(user_input)
      if valid_move?(index) == true
        letter = current_player
        move(index, letter)
        display_board
      else 
        turn
      end 
  end 
  
  def won?
    WIN_COMBINATIONS.any? do |winning_combos|
      if @board[winning_combos[0]] == @board[winning_combos[1]] && 
        @board[winning_combos[1]] == @board[winning_combos[2]] &&
        position_taken?(winning_combos[0])
        return winning_combos
      end
    end
  end 
  
  def full?
    if @board.include?(" ") == false && won? == false
      return true
    else
      return false
    end 
  end 

  def draw?
    if !won? && full?
      return true
    else 
      return false
    end
  end 
  
  def over?
    if won? || draw?
      true
    end 
  end 
  
  def winner
    array = won?
    if array == false
      return nil 
    elsif @board[array[0]] == "X"
      "X"
    else @board[array[0]] == "O"
      "O"
    end 
  end 
  
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat\'s Game!"
    end 
  end 
  
end 