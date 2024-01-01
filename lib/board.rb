class Board
    attr_reader :grid
    def initialize
      @grid = Array.new(6) { Array.new(7, " ") }
    end
    
    def display
      puts " 1   2   3   4   5   6   7"
      @grid.each do |row|
        print "| "
        row.each do |cell|
          print cell
          print " | "
        end
        puts
      end
    end

    def win?(color)
      if check_horizontal(color) || check_vertical(color) || check_diagonal_left(color) || check_diagonal_right(color)
        return true
      end
    end  
    def check_horizontal(color)
      # check horizontal
      count = 0
      @grid.each do |row|
        
        row.each do |cell|
          if cell == color
            count += 1
          else
            break
          end
        end
      end
      return true if count >= 4
    end 
    def check_vertical(color)
      # check vertical
      count = 0
      @grid.transpose.each do |row|
        
        row.each do |cell|
          if cell == color
            count += 1
          else
            break
          end
        end 
      end
      return true if count >= 4
    end
    def check_diagonal_left(color)
      # Check diagonal (top left to bottom right) 
      count = 0
      @grid.each_with_index do |row, row_index|
        
        row.each_with_index do |cell, col_index|
          if row_index + 1 < @grid.length && col_index + 1 < @grid[0].length
            if @grid[row_index + 1][col_index + 1] == color
              count += 1
            else
              break
            end
          end
        end
      end
      return true if count >= 4
    end
    def check_diagonal_right(color)
      # Check diagonal (top right to bottom left)
      count = 0
      @grid.each_with_index do |row, row_index|
        
        row.each_with_index do |cell, col_index|
          if row_index + 1 < @grid.length && col_index - 1 >= 0
            if @grid[row_index + 1][col_index - 1] == color
              count += 1
            else
              break
            end  
          end  
        end
      end 
      return true if count >= 4
    end
    def place_piece(column, color)
      row = @grid.length - 1
      while row >= 0
        if @grid[row][column] == " "
          @grid[row][column] = color
          break
        else
          row -= 1
        end
      end 
    end
    
    def available_moves
      moves = []
      @grid.each_with_index do |row, row_index|
        row.each_with_index do |cell, col_index|
          if cell == " "
            moves << col_index
          else
            next
          end  
        end
      end
      return moves
    end

end 