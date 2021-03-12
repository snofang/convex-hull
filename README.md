# Convex Hull
Elixir implementation of various algorithms to find the convex hull of a set of points.

## Algorithms
Currently the project implementes two different algorithms.
## Gift wrapping algorithm
Gift wrapping has a time complixity of O(nh), where n is the number of points and h is the number of points on the convex hull. Simple but not the most efficient algorithm, also known as Jarvis' march. Created independently by Chand & Kapur in 1970 and R. A. Jarvis in 1973. This algorithm can be used when n is small or when h is expected to be very small with respect to n. The algorithm only supports two-dimensional points.

For more information on the gift wrapping algorithm see:
* [Gift wrapping algorithm](https://en.wikipedia.org/wiki/Gift_wrapping_algorithm)

## Graham scan
Graham scan has a time complexity of O(n log n), where n is the number of points. Slighty more sophisticated, but much more efficient than the gift wrapping algorithm. Named after Ronald Graham, who published the algorithm in 1972. The algorithm only supports two-dimensional points.

For more information on Graham scan see:
* [Graham scan](https://en.wikipedia.org/wiki/Graham_scan)

## Input validity
To support the above implementations, the project also includes validity checking of the given set of points. Each point should be a tuple with as many elements as dimensions.

The current reasons for invalidity are:
* There are less than three points.
* The dimensions of the points are inconsistient.
* The points exceed the maximum supported number of dimensions of the used algorithm.

## Examples
```
iex> ConvexHull.graham_scan([{2, 1}, {0, 3}, {11, 9}, {6, 6}, {5, 5}, {7, 1}, {8, 5}, {3, 3}, {3, 7}, {7, 8}])
[{2, 1}, {7, 1}, {11, 9}, {3, 7}, {0, 3}]

iex> ConvexHull.gift_wrapping([{2, 1}, {0, 3}, {11, 9}, {6, 6}, {5, 5}, {7, 1}, {8, 5}, {3, 3}, {3, 7}, {7, 8}])
[{0, 3}, {3, 7}, {11, 9}, {7, 1}, {2, 1}]
```
**Note that there are some differences in the order and starting points of the returned convex hulls.**
