defmodule ConvexHull do
  @moduledoc """
  Module providing functions for computing a convex hull from a list of points.

  Each point should be a tuple with as many elements as dimensions. Each available convex hull algorithm specifies
  how many dimensions are supported and the running time in asymptotic notation. Each algorithm returns the same
  convex hull so we recommend that Chan's algorithm is used in most cases for performance reasons.

  Graham scan and the gift wrapping algorithm are included in the interest of demonstrating the wide range of different
  convex hull algorithms. The inclusion of less efficient algorithms in the package is further motivated by
  the fact that Chan's algorithm uses both in its own compuation.

  If you wish to read more about the many different convex hull algorithms Wikipedia is a good starting point:
  * [Convex hull algorithms](https://en.wikipedia.org/wiki/Convex_hull_algorithms)
  """
  @moduledoc since: "1.0.0"

  @doc """
  Gift wrapping has a time complixity of O(nh), where n is the number of points and h is the number of points on the convex hull.

  Simple but not the most efficient algorithm, also known as Jarvis' march. Created independently by Chand & Kapur in
  1970 and R. A. Jarvis in 1973. This algorithm can be used when n is small or when h is expected to be very small with
  respect to n. The algorithm only supports two-dimensional points.

  For more information on the gift wrapping algorithm see:
  * [Gift wrapping algorithm](https://en.wikipedia.org/wiki/Gift_wrapping_algorithm)
  """
  @doc since: "1.0.0"
  def gift_wrapping(points) do
    ConvexHull.GiftWrapping.gift_wrapping(points)
  end

  @doc """
  Graham scan has a time complexity of O(n log n), where n is the number of points.

  Slighty more sophisticated, but much more efficient than the gift wrapping algorithm. Named after Ronald Graham,
  who published the algorithm in 1972. The algorithm only supports two-dimensional points.

  For more information on Graham scan see:
  * [Graham scan](https://en.wikipedia.org/wiki/Graham_scan)
  """
  @doc since: "1.0.0"
  def graham_scan(points) do
    ConvexHull.GrahamScan.graham_scan(points)
  end

  @doc """
  Chan's algorithm has a time complexity of O(n log h), where n is the number of points and h is the number of points on the convex hull.

  Note that this algorithm is not only the most efficient in terms of time complexity but also significantly faster due to the distributed fashion
  in which the convex hull subsets are calculated. Named after Timothy M. Chan, who published the algorithm in 1996. The algorithm only supports
  two-dimensional points.

  For more information on the Chan's algorithm see:
  * [Chan's algorithm](https://en.wikipedia.org/wiki/Chan%27s_algorithm)
  """
  @doc since: "1.0.0"
  def chans_algorithm(points) do
    ConvexHull.ChansAlgorithm.chans_algorithm(points)
  end
end
