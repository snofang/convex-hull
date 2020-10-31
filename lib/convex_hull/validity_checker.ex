defmodule ConvexHull.ValidityChecker do
  @moduledoc """
  Module providing functions to check the validity of the input to the convex hull algorithms. This module contains general
  validity checks that are relevant for all algorithms, this includes checking if enough points were given to construct a
  convex hull, checking if all points have the same dimensions and checking if the points have a valid amount of dimensions.
  A relevant runtime error is raised if any of the validity checks fail.
  """
  def is_valid?(points, max_dimensions \\ nil) do

  end

  # Returns true if there are atleast 3 points (the minimum requirement for creating a convex hull). Raises runtime error if not.
  def check_number_points(points) do
    if length(points) > 2, do: true, else: raise "Cannot compute convex hull with less than 3 points."
  end

  # Returns true if all points have the same number of dimensions. Raises runtime error if not.
  def check_consistent_dimensions(points) do
    num_dimensions = length(Tuple.to_list(List.first(points)))

    if Enum.all?(points, fn point -> length(Tuple.to_list(point)) == num_dimensions end) do
      true
    else
      raise "Inconsistent number of dimensions of the given points."
    end
  end

  # Returns true if the number of dimensions of the points does not exceed the max allowed number. Raises runtime error if not.
  def check_max_dimensions(points, max_dimensions) do
    if max_dimensions == nil do
      true
    else
      if length(Tuple.to_list(List.first(points))) <= max_dimensions do
        true
      else
        raise "This algorithm does not allow more than #{max_dimensions} dimensions."
      end
    end
  end
end
