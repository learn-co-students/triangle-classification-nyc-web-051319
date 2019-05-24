class Triangle

  attr_reader :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def valid
    if (@side_1 + @side_2 <= @side_3) || (@side_1 + @side_3 <= @side_2) || (@side_2 + @side_3 <= @side_1)
      raise TriangleError
    elsif  [@side_1, @side_2, @side_3].include?(0)
      raise TriangleError
    end
  end

  def kind
    valid
    if @side_1 == @side_2 && @side_2 == @side_3 && @side_1 == @side_3
      return :equilateral
    elsif (@side_2 == @side_3) || (@side_1 == @side_3) || (@side_1 == @side_2)
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError

  end
end
