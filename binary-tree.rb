field = [
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
  [1,1,1,1],
]

def generate_field(size)
  result = []
  for j in 0...size
    if j == size
      result.push([1,0] * size)
      next
    end
    row = []
    for i in 0...size
      #[isLeft, isRight]
      if i == size
        tree = [0, 1]
      else
        index = rand(0..1)
        tree = [0, 0]
        tree[index] = 1
      end
      row.push(tree)
    end
    result.push row
  end
  result
end

def field_from_trees(trees)
  size = trees.length * 2 + 1
  field = []
  for i in 0...size
    field.push [0] * size
  end
  for i in 0...size
    if i % 2 == 0
      next
    end
    field[0][i] = 1
    field[size - 1][i] = 1
    field[i][0] = 1
    field[i][size - 1] = 1
  end
  for i in 0...trees.length
    for j in 0..trees.length
      down, right = trees[i][j]
      field[i * 2 + 1][j * 2] == 1 if down == 1
      field[i * 2 ][j * 2 + 1] == 1 if right == 1
    end
  end
  field
end



def maze(field)
  field.each_with_index do |row, rindex|
    row.each_with_index do |cell, cindex|
      if rindex % 2 == 1
        if cindex % 2 == 1
          print '  '
        else
          print '|'
        end
      else
        if cindex % 2 == 1
          print '--'
        else
          print '*'
        end
      end
    end
    puts
  end
end

if __FILE__ == $0
  field = [
    [0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0],
  ]
  maze(field)
end
