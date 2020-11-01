defmodule ConvexHull.GrahamScan do
  @moduledoc """
  Named after Ronald Graham, who published the algorithm in 1972. The algorithm has a time complexity of O(n log n) where
  n is the number of points. The algorithm only supports two-dimensional points.
  """
  def graham_scan(points) do
    try do
      ConvexHull.ValidityChecker.is_valid?(points, 2)

    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end
  end
end
