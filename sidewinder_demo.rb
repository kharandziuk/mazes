require 'bundler/setup'
require 'grid'
require 'sidewinder'

grid = Grid.new(40, 40)
Sidewinder.on(grid)

#print grid
img = grid.to_png
print img
