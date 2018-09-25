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

p self_dividing_num(1,22)