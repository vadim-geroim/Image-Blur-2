class Image
  attr_accessor :transformed_matrix

  def initialize(matrix)
    @matrix = matrix
  end

# This method outputs transformed matrix
  def output_image
    @transformed_matrix.each do |element|
      puts element.join
    end
  end

  # This method clones matrix but replaces all ones to be zero
  def blank_matrix(matrix)
    matrix.map do |element_array|
      element_array.map {|element| element = 1 ? element = 0 : element = 0 }
    end
  end

  def blur
    #Creates template result matrix with the same dimention as original
    @transformed_matrix = blank_matrix(@matrix) 
    @matrix.each_with_index do |element_array, i|
      element_array.each_with_index do |element, j|
        if element == 1 
          @transformed_matrix[i][j] = 1
          # if the first element change only the next
          if j == 0
            @transformed_matrix[i][j+1] = 1
          # if the last element change only the previous
          elsif j == element_array.length - 1
            @transformed_matrix[i][j-1] = 1
          # change the previous and the next  
          else
            @transformed_matrix[i][j-1] = 1
            @transformed_matrix[i][j+1] = 1
          end 

          if i == 0
            @transformed_matrix[i+1][j] = 1
          elsif i == @matrix.length - 1
            @transformed_matrix[i-1][j] = 1
          else
            @transformed_matrix[i-1][j] = 1
            @transformed_matrix[i+1][j] = 1
          end 
        end
      end
    end
    @transformed_matrix 
  end
end