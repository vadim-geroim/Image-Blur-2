# Image Blur #2: Build Data Representation of an Image
require 'matrix'

class Image
  attr_reader :matrix_result

  def initialize(matrix)
    @matrix = matrix_validation(matrix)
    @matrix_result = Matrix.build(@matrix.row_count) { 0 }
  end

  def matrix_validation(matrix)
    unless matrix.empty?
      @matrix = matrix
    else
      puts "Please check your input"
      exit
    end
  end

  def output
    @matrix_result.to_a.each { |element| puts element.join('') }
  end

  def transformation
    @matrix.each_with_index do | element, row, col |
      unless element.eql?0 
        @matrix_result[row, col] = 1
        if row.zero? && co.zero?
          set_next_elements
        elsif row == @matrix.row_count && col == @matrix.col_count
          set_previous_elements 
        else
          set_next_elements
          set_previous_elements
        end        
      end
    end

    def set_next_elements
      set_next_in_row
      set_next_in_column
    end

    def set_previous_elements
      set_previous_in_row
      set_previous_in_column 
    end

    def set_next_in_row
      @matrix_result[row+1, col] = 1
    end

    def set_previous_in_row
      @matrix_result[row-1, col] = 1
    end

    def set_next_in_column
      @matrix_result[row, col+1] = 1
    end

    def set_previous_in_column
      @matrix_resutl[row, col-1] = 1 
    end

    # @matrix.each_with_index do |element_array, i|
    #   element_array.each_with_index do |element, j|
    #     if element == 1 
    #       @matrix_result[i,j] = 1
    #       # if the first element change only the next
    #       if j.zero?
    #         @matrix_result[i,j+1] = 1
    #       # if the last element change only the previous
    #       elsif j == element_array.length - 1
    #         @matrix_result[i,j-1] = 1
    #       # change the previous and the next  
    #       else
    #         @matrix_result[i,j-1] = 1
    #         @matrix_result[i,j+1] = 1
    #       end 

    #       if i.zero?
    #         @matrix_result[i+1,j] = 1
    #       elsif i == @matrix.length - 1
    #         @matrix_result[i-1,j] = 1
    #       else
    #         @matrix_result[i-1,j] = 1
    #         @matrix_result[i+1,j] = 1
    #       end 
    #     end
    #   end
    # end 
  end
end

image = Image.new(Matrix[
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

# [[1, 0, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 0, 0]]

# [[1, 0, 0, 0], 
#  [0, 1, 1, 0], 
#  [0, 0, 0, 1], 
#  [1, 0, 0, 0]]

image.transformation
image.output
