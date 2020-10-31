defmodule ConvexHull.ValidityChecker do
  @moduledoc """
  Module providing functions to check the validity of the input to the convex hull algorithms. This module contains general
  validity checks that are relevant for all algorithms, this includes checking if enough points were given to construct a
  convex hull, checking if all points have the same dimensions and checking if the points have a valid amount of dimensions.
  A relevant runtime error is raised if any of the validity checks fail.
  """
  def is_valid?(points, max_dimensions \\ nil) do

  end

  # Returns true if there are atleast 3 points (the minimum requirement for creating a convex hull).
  def check_number_points(points), do: length(points) > 2

  # Returns true if all points have the same number of dimensions.
  def check_consistent_dimensions(points) do
    num_dimensions = length(Tuple.to_list(List.first(points)))

    Enum.all?(points, fn point -> length(Tuple.to_list(point)) == num_dimensions end)
  end

  # Returns true if the number of dimensions of the points does not exceed the max allowed number.
  def check_max_dimensions(points, max_dimensions) do
    if max_dimensions == nil do
      true
    else
      length(Tuple.to_list(List.first(points))) <= max_dimensions
    end
  end
end
