# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

def any_zero_side?(a, b, c)
  [a, b, c].any?(:zero?)
end

def any_negative_side?(a, b, c)
  [a, b, c].any?(:negative?)
end

def hicks_sum_smaller_than_hypothenuse?(a, b, c)
  hick_1, hick_2, hypothenuse = [a, b, c].sort
  hick_1 + hick_2 <= hypothenuse
end

def triangle(a, b, c)
  raise TriangleError if any_zero_side?(a, b, c)
  raise TriangleError if any_negative_side?(a, b, c)
  raise TriangleError if hicks_sum_smaller_than_hypothenuse?(a, b, c)

  if a == b && b == c
    :equilateral
  elsif a == b || a == c || b == c
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
