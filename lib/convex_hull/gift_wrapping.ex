defmodule ConvexHull.GiftWrapping do
  @moduledoc false

  def gift_wrapping(points) do
    try do
      ConvexHull.ValidityChecker.is_valid?(points, 2)

      leftmost = get_leftmost_point(points)
      gift_wrapping(points, leftmost, [leftmost])
    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end
  end
  def gift_wrapping(points, current, convex_hull) do
    next_point = get_next_point(points, current)
    # If the next point is equal to the first point of the convex hull we are finished.
    if next_point == List.first(convex_hull) do
      convex_hull
    else
      gift_wrapping(List.delete(points, next_point), next_point, convex_hull ++ [next_point])
    end
  end

  # Find a point that is guaranteed to be in the convex hull.
  defp get_leftmost_point(points) do
    Enum.reduce(points, List.first(points), fn {x, y}, {x_acc, y_acc} ->
      if x < x_acc, do: {x, y}, else: {x_acc, y_acc}
    end)
  end

  # Return the next point on the convex hull.
  defp get_next_point([{x, y} | rest_points], {current_x, current_y}) do
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

  # Calculate a simple cross product for two dimensional vectors. Only returns the z value.
  defp cross_product({x_v1, y_v1}, {x_v2, y_v2}) do
    (x_v1 * y_v2) - (x_v2 * y_v1)
  end
end
