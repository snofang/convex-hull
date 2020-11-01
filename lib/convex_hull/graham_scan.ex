defmodule ConvexHull.GrahamScan do
  @moduledoc false

  # Points used for testing: points = [{2, 1}, {0, 3}, {11, 9}, {6, 6}, {5, 5}, {7, 1}, {8, 5}, {3, 3}, {3, 7}, {7, 8}, {1, 5}]

  def graham_scan(points) do
    try do
      ConvexHull.ValidityChecker.is_valid?(points, 2)

    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end
  end

  # Find the point with the lowest y-coordinate. If there are multiple points with the lowest y-coordinate, the one with the lowest x-coordinate is returned.
  def get_lowest_point(points) do
    List.first(Enum.sort(points, fn {x1, y1}, {x2, y2} ->
      if y1 == y2, do: x1 < x2, else: y1 < y2
    end))
  end

  # Sorts the points in increasing order of the angle they and the lowest point make with the x-axis.
  def sort_by_angle(points, {lowest_x, lowest_y}) do
    Enum.sort(points, fn {x1, y1}, {x2, y2} ->
      v1 = {(lowest_x - x1), (lowest_y - y1)}
      v2 = {(lowest_x - x2), (lowest_y - y2)}

      ConvexHull.Utility.cross_product(v1, v2) > 0
    end)
  end
end
