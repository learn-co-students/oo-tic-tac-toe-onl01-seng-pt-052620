class TicTacToe

    attr_reader :board

    WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    puts "Welcome to Tic Tac Toe!"
    
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
      
      # code your input_to_index and move method here!
    def input_to_index(input)
      
       @index = input.to_i - 1
      
    end
      
    def move(index, player_char)
      
        @board[index] = player_char
      
    end

    def position_taken?(index)

        @board[index] == "X" || @board[index] == "O"     
    
    end

    def valid_move? (index)

        index.between?(0, 8) && !position_taken?(index)
    
    end

    def turn

        puts "Please enter 1-9:"
        input = gets.strip
    
        index = input_to_index(input)
    
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    
    end

    def turn_count

        counter = 0
    
        @board.each do |player|
            if player == "X" || player == "O"
                counter += 1
            end
        end
    
        counter
    
    end
    
    def current_player
    
        turn_count.even? ? "X" : "O"
    
    end

    def won?
      
        WIN_COMBINATIONS.find do |winning|
                
          win_index_1 = winning[0]
          win_index_2 = winning[1]
          win_index_3 = winning[2]
      
          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X" 
            return winning
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O" 
            return winning
          else
            false
          end
      
        end
      
    end
    
    def full?

        if @board.include?(" ") || @board.include?("")
            false
        else
            true
        end

    end

    def draw?

        full? && !won?
      
    end
      
    def over?
      
        !!(won? || draw?)
      
    end
      
    def winner
      
        won? && @board[won?.first]
      
    end



    def play

        until over?
            turn
        end

        if won? 
           puts "Congratulations #{winner}!"
        else
           puts "Cat's Game!"
        end
        
    end


end
