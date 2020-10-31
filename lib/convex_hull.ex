defmodule ConvexHull do
  @moduledoc """
  Module providing functions for computing a convex hull from a list of points. Each point should be a tuple with as many elements as dimensions.
  Each available convex hull algorithm specifies how many dimensions are supported and the running time in asymptotic notation.
  """
  # Wrapper for the gift wrapping algorithm that allows users of the package to access it easier.
  def gift_wrapping(points) do
    ConvexHull.GiftWrapping.gift_wrapping(points)
  end
end
