def full_field(size)
  field = []
  for _ in 0...size
    field.push [1] * size
  end
  field[1][0] = 0
  field
end

def binary_maze(field, step_fc = nil)
  cells = (1...field.length).select {|el| el % 2 == 1}
  for i in cells
    for j in cells
      if i == cells[-1]
        field[i][j+1] = 0
      elsif j == cells[-1]
        field[i+1][j] = 0
      elsif rand(0..1) == 1
        field[i+1][j] = 0
      else
        field[i][j+1] = 0
      end
      step_fc.call(field)
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
          if cell == 1
            print '|'
          else
            print ' '
          end
        end
      else
        if cindex % 2 == 1
          if cell == 1
            print '--'
          else
            print '  '
          end
        else
          print '*'
        end
      end
    end
    puts
  end
end

print_with_delay = Proc.new do |field|
  system "clear"
  maze(field)
  sleep 0.1
end

if __FILE__ == $0
  field = full_field(31)

  maze(binary_maze(field, print_with_delay))
end
