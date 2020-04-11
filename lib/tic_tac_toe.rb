class TicTacToe
  WIN_COMBINATIONS = [  
    [0,1,2], [3,4,5], [6,7,8], # horizontals
    [0,3,6], [1,4,7], [2,5,8], # verticals
    [0,4,8], [2,4,6]  # diagnals
  ]
  
  def initialize
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    converted_input = user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index >= 0 && index <= 8
      if position_taken?(index) == false
        true
      else
        false
      end
    else
      false
    end
  end
  
  def turn_count
    counter = 0
  
    @board.each do |board_space|
      if board_space == "X" || board_space == "O"
        counter += 1
      end
    end
  
    counter
  end
  
  def current_player
    player = " "
  
    if turn_count % 2 == 0
      player = "X"
    else
      player = "O"
    end
  
    player
  end
  
  def turn
    index = gets.strip
    converted_index = input_to_index(index)
  
    if valid_move?(converted_index) == true
      move(converted_index, current_player)
      display_board
    else
      turn
    end
  end
  
  def draw?
    if won? == false && full? == true
      true
    else
      false
    end
  end


end







