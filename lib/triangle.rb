require 'pry'

class Triangle
  attr_accessor :side1, :side2, :side3

  class TriangleError < StandardError
    def message
      "Triangles must have two sides that must add up to more than third and sides must not be equal to zero"
    end
  end

  def initialize(side1, side2, side3)
    if !triangle_valid?(side1, side2, side3)
      begin
        raise TriangleError
      #
      # rescue TriangleError => error
      #   puts error.message
      #   binding.pry
      end
    else
      @side1 = side1
      @side2 = side2
      @side3 = side3
    end
  end

  def kind
    determine_kind(match_sides)
  end

  def triangle_valid?(side1, side2, side3)
    #if one side is 0, don't bother running rest of function
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      return false
    elsif !side_validity(side1, side2, side3)
      return false
    else
      return true
    end
  end

  def side_validity(side1, side2, side3)
    side_array = [side1, side2, side3]
    side_array.sort!
    if side_array[0] + side_array[1] <= side_array[2]
      return false
    else
      return true
    end
  end


#based on how many sides are equal, returns symbol of triangle tyep
  def determine_kind(int)
    if int == 3
      return :equilateral
    elsif int == 2
      return :isosceles
    else
      return :scalene
    end
  end

#returns an int of how many sides are equal
  def match_sides
    if @side1 == @side2 && @side1 == @side3
      return 3
    elsif @side1 == @side2 || @side1 == @side3
      return 2
    elsif @side1 == @side2 || @side2 == @side3
      return 2
    else
      return 1
    end
  end
end
