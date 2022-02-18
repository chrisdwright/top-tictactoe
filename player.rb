class Player

    attr_reader :name
    attr_reader :marker

    def initialize(game, name, marker)
        @game = game
        @name = name
        @marker = marker
    end

    def start_turn
        puts "#{@name}, it's your turn."

        loop do
            print "Select a position: "
            position = gets.chomp.to_i

            if position > 0 && position < 10
                index = position - 1
                if @game.board[index].is_a? Numeric
                    print "\n"
                    @game.board[index] = @marker
                    break
                else
                    puts "Position is already taken."
                end
            elsif position < 1 || position > 9
                puts "Position out of range."
            end
        end
        
    end

end