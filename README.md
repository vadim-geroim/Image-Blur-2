# Image-Blur-2
Solution and Tests to the Columbia University Image #2 problem.

## Project structure
- `lib/image.rb`  - contains solution
- `spec/image_spec.rb` - includes three different examples

## Solution
- the method `blank_matrix` - gets as a parameter matrix and
and converts it to the matrix with the same dimention but with 
only zero values in it. 
- the method `blur` - iterates through the matrix specified in a 
class constructor and if met ones it will replaces values in the 
matrix called `transformed_matrix` which is used as a result of the
programm. This method returns `transformed_matrix` as a result.
- the method `output_image` - convert matrix to string and print it 
in a console

## Test execution
- Run `bundle install`
- Open terminal window
- From the project directory run `rspec`


