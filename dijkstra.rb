require 'bundler/setup'
require 'distance_grid'
require 'binary_tree'

grid = DistanceGrid.new(10, 10)
BinaryTree.on(grid)
start = grid[0, 0]
distances = start.distances
grid.distances = distances
puts grid
