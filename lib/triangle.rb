require 'pry'
class Triangle

  attr_reader :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1, @s2, @s3 = s1, s2, s3
  end

  def kind
    #binding.pry
    if [@s1, @s2, @s3].include?(0) || @s1 + @s2 <= @s3 || @s1 + @s3 <= @s2 || @s2 + @s3 <= @s1 #check if valid triangle
      #begin
        raise TriangleError  
      #rescue TriangleError => exception
      #end
    else
      if @s1 == @s2 && @s2 == @s3
        :equilateral
      elsif [@s1, @s2, @s3].uniq.count == 2
        :isosceles
      else
        :scalene
      end
    end
  end
    
    class TriangleError < StandardError
      # def message
      #   puts "Invalid Triangle"
      # end
    end
end

