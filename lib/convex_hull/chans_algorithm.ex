defmodule ConvexHull.ChansAlgorithm do
  @moduledoc false

  def chans_algorithm(points) do
    try do
      ConvexHull.ValidityChecker.is_valid?(points, 2)

      chans_algorithm(points, 3)
    rescue
      e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
    end
  end

  def chans_algorithm(points, convex_hull_size_guess) do

  end
end
