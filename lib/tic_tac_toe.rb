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

  def position_taken?(index)
    board[index] != (" ") 
  end

  def valid_move?(index)
    board[index] == (0..9) 
    board[index] == (" ")   
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
    player_input = gets
    player_index = input_to_index(player_input)
    if valid_move?(player_index)
      board[player_index] = current_player
      display_board
    else
      player_input = gets
    end

    # valid_move?(player_index)
    # current_player

    # move_input = gets
    # move_index = input_to_index(move_input)
    board[player_index] = current_player
    display_board


  end








end