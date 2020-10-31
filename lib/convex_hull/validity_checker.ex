defmodule ConvexHull.ValidityChecker do
  @moduledoc """
  Module providing functions to check the validity of the input to the convex hull algorithms. This module contains general
  validity checks that are relevant for all algorithms, this includes checking if enough points were given to construct a
  convex hull, checking if all points have the same dimensions and checking if the points have a valid amount of dimensions.
  A relevant runtime error is raised if any of the validity checks fail.
  """
  def is_valid(points, max_dimensions \\ nil) do

  end

  def check_number_points(points) do

  end

  def check_consistent_dimensions(points) do

  end

  def check_max_dimensions(points, max_dimensions) do

  end
end
