require 'bundler/setup'
require 'solid_assert'


def sidewinder(field)
  odds = (1...field.length).select {|el| el % 2 == 1}
  for row in odds
    if row == odds.last
      for wall in 2..field.length
        field[row][wall] = 0
      end
      next
    end
    last = 1
    for cell in odds
      if [true, false].sample and cell != odds.last
        field[row][cell+1] = 0
      else
        # counter previous
        wall_to_remove = odds.select { |el| last <= el and el <= cell }
          .sample
        assert field[row+1][wall_to_remove] == 1
        field[row+1][wall_to_remove] = 0
        last = cell + 2
      end
    end
  end
  field
end

def full_field(size)
  field = []
  for _ in 0...size
    field.push [1] * size
  end
  field[1][0] = 0
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

if __FILE__ == $0
  field = full_field(31)

  maze(sidewinder(field))
end
