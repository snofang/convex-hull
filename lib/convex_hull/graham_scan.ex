defmodule ConvexHull.GrahamScan do
  @moduledoc false

  # Points used for testing: points = [{2, 1}, {0, 3}, {11, 9}, {6, 6}, {5, 5}, {7, 1}, {8, 5}, {3, 3}, {3, 7}, {7, 8}, {1, 5}, {5, 0}, {5, 12}, {0, 10}]

  def graham_scan(points) do
    try do
      ConvexHull.ValidityChecker.is_valid?(points, 2)

      [lowest_point | points] = sort_by_y(points)

      # Extracting the two first points since they are added to the convex hull initially along with the lowest point.
      [p1 | [p2 | sorted_points]] = sort_by_angle(points, lowest_point)
      graham_scan(sorted_points, [lowest_point, p1, p2])
    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end
  end
  def graham_scan([], convex_hull), do: convex_hull
  def graham_scan([{x3, y3} | rest_points], convex_hull) do
    # Get the last two elements of the convex hull to check the direction of the turn from p1 to p3 through p2.
    [{x1, y1}, {x2, y2}] = Enum.take(convex_hull, -2)

    v1 = {(x1 - x2), (y1 - y2)}
    v2 = {(x1 - x3), (y1 - y3)}

    # If the z value of the cross product is positive then the three points constitute a left turn which means we want to add p3 to the convex hull.
    if ConvexHull.Utility.cross_product(v1, v2) > 0 do
      graham_scan(rest_points, convex_hull ++ [{x3, y3}])
    # If not then we want to remove p2 from the convex hull and try again.
    else
      # The double reverse pattern to remove the last element of the convex hull is used for efficiency reasons.
      graham_scan([{x3, y3}] ++ rest_points, Enum.reverse(convex_hull) |> tl() |> Enum.reverse())
    end
  end

  # Sorts the points in increasing order of y-coordinate. If there are multiple points with the lowest y-coordinate, the one with the lowest x-coordinate is first.
  defp sort_by_y(points) do
    Enum.sort(points, fn {x1, y1}, {x2, y2} ->
      if y1 == y2, do: x1 < x2, else: y1 < y2
    end)
  end

  # Sorts the points in increasing order of the angle they and the lowest point make with the x-axis.
  defp sort_by_angle(points, {lowest_x, lowest_y}) do
    Enum.sort(points, fn {x1, y1}, {x2, y2} ->
      v1 = {(lowest_x - x1), (lowest_y - y1)}
      v2 = {(lowest_x - x2), (lowest_y - y2)}

      ConvexHull.Utility.cross_product(v1, v2) > 0
    end)
  end
end
