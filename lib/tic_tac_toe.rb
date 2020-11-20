class TicTacToe
attr_accessor :board



def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
    # @board = Array.new(9, "")
    
end

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}  "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}  "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}  "
end

def input_to_index (user_input)
    user_input.to_i - 1

end

def move(index, token)
    @board[index] = token
end

#what do i need?
# token
#position

def position_taken? (index)
    @board[index] != " "
    # return true
end

def valid_move? (index)
    # @board[index] == " "
    index.between?(0,8) && !position_taken?(index)
end

#Must be index 1-9(0-8)
#Position cant be taken

def turn_count
    @board.count{|space| space != " "}
end

def current_player
    if turn_count.even?
        "X"
    else
        "O"
    end
end
    # turn_count.even? ? "X" : "O"
    #X is default first player
 #How do we know what player it is
 # if X is first = turn 0
 # if O is second = turn 1


def turn
    puts "Please enter 1 - 9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
        token = current_player
        move(index, token)
    else
        turn
    end
    display_board
end


#convert user input to index
#check if input is a valid move
#it needs to know what player is playing

def won?
    WIN_COMBINATIONS.each {|win_combo|
        index_0 = win_combo[0]
        index_1 = win_combo[1]
        index_2 = win_combo[2]

        position_1 = @board[index_0]
        position_2 = @board[index_1]
        position_3 = @board[index_2]

        if position_1 == "X" && position_2 == "X" &&position_3 == "X"
            return win_combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
        end
    }
    return false
end

#Check each win combo
#Figure out the index contains x or o
#if x or o, take up the whole combo, obvi they win

def full?
    @board.all? {|position| position != " "}
end
#is the board full?
 #--no empty spots (strings)

def draw?
    full? && !won?
end

# if no one has won
# if the board is full


def over?
    draw? || won?
end

#game is over when
#someone won
#when its a draw

def winner
    if combo = won?
        @board[combo[0]]
    end 

   
end

#who is the winner?
#winner has a winning combo
    #Check index

def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    
end


end
