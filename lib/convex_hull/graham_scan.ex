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
    Enum.sort(points, fn {x1, y1}, {x2, y2} ->
      if y1 == y2, do: x1 < x2, else: y1 < y2
    end)
  end
end
