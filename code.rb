def judge_circles(moves)
    arr = moves.split('')
    pos_init = [0,0]
    moves.chars do |move|
        if move == 'U'
            pos_init[0] += 1
        elsif move == 'D'
            pos_init[0] -= 1
        elsif move == 'L'
            pos_init[1] -= 1
        elsif move == 'R'
            pos_init[1] += 1
        end
    end
    pos_init[0] == 0 && pos_init[1] == 0
end

p judge_circles('UDL')

# write a helper function that evaluates if number is self dividing
#   this function should iterate through each digit in the num and check if num mod digit == 0 else return false
#   returns true or false
# iterate through each num and check if it is self dividing
# can i assume that both inputs are integers?

def self_dividing_num(lower, upper)
    result = []
    (lower..upper).each do |num|
        result.push(num) if self_divide(num)            
    end
    result
end

def self_divide(num)
    str_num = num.to_s
    str_num.chars do |digit|
        return false if digit == "0"
        if ((num % digit.to_i) != 0)
            return false
        end
    end
    true
end

# p self_dividing_num(1,22)

# input a 2d array
# output the sum of the max increase
# find the l/r max heights and then the t/b max heights
# iterate through array and see if min btwn l/r max and t/b max is different 
# if so sum difference between min and add to result
def keep_skyline(grid) 
    top = []
    side = []
    grid.length.times do |x|
        rowMax = 0
        colMax = 0
        grid.length.times do |y|        
            row = grid[x][y] 
            col = grid[y][x]
            rowMax = row if row > rowMax
            colMax = col if col > colMax
        end
        top.push(colMax)
        side.push(rowMax)
    end
    result = 0
    grid.length.times do |i|
        grid.length.times do |j|
            el = grid[i][j]
            min = [top[j], side[i]].min
            result += (min - el) if el < min
        end
    end
    result
end

grid = 
[ [3, 0, 8, 4], 
[2, 4, 5, 7],
[9, 2, 6, 3],
[0, 3, 1, 0] ]

p keep_skyline(grid)