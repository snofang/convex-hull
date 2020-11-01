defmodule ConvexHull.GrahamScan do
  @moduledoc false

  def graham_scan(points) do
    try do
      ConvexHull.ValidityChecker.is_valid?(points, 2)

    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end
  end
end
