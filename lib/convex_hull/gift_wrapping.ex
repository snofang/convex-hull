defmodule ConvexHull.GiftWrapping do
  @moduledoc """
  Also known as Jarvis' march after R. A. Jarvis who published it in 1973. Simple but not the most efficient algoritm.
  The algorithm has a time complixity of O(nh), where n is the number of points and h is the number of points on the convex hull.
  This algorithm can be used when n is small or when h is expected to be very small with respect to n.
  """
  def gift_wrapping(points) do
    if ConvexHull.ValidityChecker.is_valid?(points, 2) do

    end
  end

  # Find a point that is guaranteed to be in the convex hull.
  def get_leftmost_point(points) do
    Enum.reduce(points, List.first(points), fn {x, y}, {x_acc, y_acc} ->
      if x < x_acc, do: {x, y}, else: {x_acc, y_acc}
    end)
  end

  # Returns the next point on the convex hull.
  def get_next_point([{x, y} | rest_points], {current_x, current_y}) do
    Enum.reduce(rest_points, {x, y}, fn {check_x, check_y}, {next_x, next_y} ->
      # Vector from current to what we currently think is the next point in the convex hull.
      v1 = {(current_x - next_x), (current_y - next_y)}
      # Vector from current to what we are checking if should be the next point in the convex hull.
      v2 = {(current_x - check_x), (current_y - check_y)}

      # If the z value is positive it means the point we are checking is to the left of the previously
      # believed next point and therefore more likely to be on the convex hull.
      if cross_product(v1, v2) > 0, do: {check_x, check_y}, else: {next_x, next_y}
    end)
  end

  # Calculates a simple cross product for two dimensional vectors. Only returns the z value.
  def cross_product({x_v1, y_v1}, {x_v2, y_v2}) do
    (x_v1 * y_v2) - (x_v2 * y_v1)
  end
end
