# Image Blur #1: Build Data Representation of an Image

class Image
	def initialize(matrix)
		@matrix = matrix
		validate_matrix(@matrix)
	end

	def is_array?(array)
		unless array.instance_of? Array
			puts "Please verify the data for matrix. It requires to be a two-dimentional array."
			exit 
		end
	end

	# This method validates specified matrix in the initialize method
	def validate_matrix(matrix)
		is_array?(matrix)
		matrix.each { |element| is_array?(element)}
	end

# This method outputs transformed matrix
	def output_image
		@transformed_matrix.each do |element|
			puts element.join
		end
	end

	# This method replaces all one to be zero. 
	def blank_matrix(matrix)
		matrix.map do |element_array|
			element_array.map {|element| element = 1 ? element = 0 : element = 0 }
		end
	end

  # this method returns transformed matrix
	def transformation
		# assign blank matrix with the same dimention as original @matrix
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
	end
end

image = Image.new([
  [1, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.transformation
image.output_image
