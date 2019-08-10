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

	def validate_matrix(matrix)
		is_array?(matrix)
		matrix.each { |element| is_array?(element)}
	end

	def transformation
		@matrix_traformed = @matrix
		@matrix.each_with_index do |one_dim_array, one_dim_array_index|
			if one_dim_array.include?(1)
				selected_indexes(one_dim_array).each do |selected_index|
				@matrix_trasform = transform_inline(selected_index, one_dim_array)

		   #    if (one_dim_array_index - 1 >= 0)
					#   @matrix[one_dim_array_index - 1][selected_index] = 1
					# # elsif (one_dim_array_index + 1 <= @matrix.length-1)
					# #   @matrix[one_dim_array_index + 1][selected_index] = 1	  
				 #  end
				end
			end
		end
	end

	def transform_inline(index, array)
	  # replace the first element
		if index.eql?(0)
			array[index + 1] = 1
		# replace the last element
		elsif index.eql?(array.length - 1)
			array[index - 1] = 1
		# replace any if not the first and last
		else
			array[index - 1] = 1
			array[index + 1] = 1 
		end
	end

	def selected_indexes(one_dim_array)
		one_dim_array.each_index.select{|element| one_dim_array[element] == 1}
	end

	def output_image
		@matrix_traformed.each do |element|
			puts element.join
		end
	end
end

image = Image.new([
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [1, 0, 0, 1]
])

image.transformation
 image.output_image
