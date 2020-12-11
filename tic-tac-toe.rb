class Player
    attr_reader :name, :sign 
    def initialize(name,sign)
        @name = name
        @sign = sign
    end
end
class TicTacToe

    def initialize
        print "name for player1: "; player1_name = gets.chomp
        print "sing for player1: "; player1_sign = gets.chomp
        print "name for player2: "; player2_name = gets.chomp
        print "sing for player2: "; player2_sign = gets.chomp
    
    if player2_sign == player1_sign
        print"you can't have same sign, choose another: "; player2_sign == gets.chomp
    end
    @players = [Player.new(player1_name,player1_sign),Player.new(player2_name,player2_sign)]
    @board_grids = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
end

def show_board 
    puts 
    puts "-------------"
    puts "| #{@board_grids[0]} | #{@board_grids[1]} | #{@board_grids[2]} | "
    puts "-------------"
    puts "| #{@board_grids[3]} | #{@board_grids[4]} | #{@board_grids[5]} | "
    puts "-------------"
    puts "| #{@board_grids[6]} | #{@board_grids[7]} | #{@board_grids[8]} | "
    puts "-------------"
    puts 
  end 
  def start
    starting_player = @players.sample
    puts "The starting player is #{starting_player.name}"
    puts "Let's start"
    play_round(starting_player)
  end
  def choose_sign
    sign = gets.chomp
    sign = sign.split("").shift
    sign
  end
  def win?(player)
    (@board_grids[0] == player.sign && @board_grids[1] == player.sign && @board_grids[2] == player.sign) ||
    (@board_grids[3] == player.sign && @board_grids[4] == player.sign && @board_grids[5] == player.sign) ||
    (@board_grids[6] == player.sign && @board_grids[7] == player.sign && @board_grids[8] == player.sign) ||
    (@board_grids[0] == player.sign && @board_grids[3] == player.sign && @board_grids[6] == player.sign) ||
    (@board_grids[1] == player.sign && @board_grids[4] == player.sign && @board_grids[7] == player.sign) ||
    (@board_grids[2] == player.sign && @board_grids[5] == player.sign && @board_grids[8] == player.sign) ||
    (@board_grids[0] == player.sign && @board_grids[4] == player.sign && @board_grids[8] == player.sign) ||
    (@board_grids[2] == player.sign && @board_grids[4] == player.sign && @board_grids[6] == player.sign)
  end 

  def choose_grid
    print"Choose grid(o to 8): "
    grid_id = gets
    grid_id = grid_id.to_i
    if @board_grids[grid_id] !=" " || grid_id < 0 || grid_id > 8
        return choose_grid
    else
        return grid_id
    end
  end

  def update_grid(grid_id,sign)
    @board_grids[grid_id] = sign
  end 

  def board_full?
    @board_grids.all? {|grid| grid !=" "}
  end

  def play_round(player)
    show_board

    puts "Current player: #{player.name} #{player.sign}"

    update_grid(choose_grid, player.sign)

    if win?(player)
        show_board
        puts "#{player.name} (#{player.sign}) wins this game!"
    elsif board_full?
        show_board
        puts"It's draw"
    else
        play_round(@players[@players.index(player)-1])
    end
end

end
game = TicTacToe.new
puts ""
game.start
