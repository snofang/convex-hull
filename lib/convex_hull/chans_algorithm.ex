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
    # Partition the set of points into subsets with at most 'convex_hull_size_guess' points in each.
    point_subsets = Enum.chunk_every(points, convex_hull_size_guess)

    # Compute the convex hull of each subset in parallel.
    tasks = Enum.map(point_subsets, fn point_subset ->
      Task.async(fn -> ConvexHull.graham_scan(point_subset) end)
    end)

    # Gathering the results from the tasks and removing metadata.
    results = Task.yield_many(tasks, :infinity)
    subsets_convex_hulls = Enum.map(results, fn {_task, {:ok, results}} -> results end)
  end
end
