
    # Part 1

class Board
    attr_accessor :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = n * n 
    end

    def [](indice)
        row, col = indice
        @grid[row][col]
    end

    def []=(indice, value)
        row, col = indice
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    # Part 2 

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            return true
        else 
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        ships = @size * 0.25
        # puts "Ships : #{ships}"

        while self.num_ships < ships
            rand_row = rand(0...@grid.length)  
            rand_col = rand(0...@grid.length)  
            position = [rand_row, rand_col]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row| 
            row.map do |ele| 
                if ele == :S 
                    :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end


end

