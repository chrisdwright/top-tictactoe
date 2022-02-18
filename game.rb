require_relative 'player'

class Game

    attr_reader :board

    def initialize
        run_menu
    end

    def run_menu
        print "\n"
        puts "+====== Tic Tac Toe ======+"
        puts "| 1. Start Game           |"
        puts "| 2. Quit                 |"
        puts "+=========================+"
        print "Select option: "
        option = gets.chomp.to_i
        print "\n"

        case option
        when 1
            start_game
        when 2
            print "Thank you for playing!\n\n"
        end
    end

    def start_game
        @players = [Player.new(self, "Player 1", "X"), Player.new(self, "Player 2", "O")]
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

        @turnIndex = rand(2)
        print @players[@turnIndex].name + " goes first!\n\n"

        loop do
            print_board

            @players[@turnIndex].start_turn
            win = check_for_win(@players[@turnIndex])
            break if win

            @turnIndex = 1 - @turnIndex
        end

        print_board
        print "#{@players[@turnIndex].name} is victorious!"
        gets
        run_menu
    end

    def print_board
        print_board_row(@board[0], @board[1], @board[2])
        puts "---+---+---"
        print_board_row(@board[3], @board[4], @board[5])
        puts "---+---+---"
        print_board_row(@board[6], @board[7], @board[8])
        print "\n"
    end

    def print_board_row(col1, col2, col3)
        puts " " + col1.to_s + " | " + col2.to_s + " | " + col3.to_s
    end

    def check_for_win(player)
        lines = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], 
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]

        lines.any? do |line|
            line.all? { |position| @board[position] == player.marker }
        end
    end

end

game = Game.new