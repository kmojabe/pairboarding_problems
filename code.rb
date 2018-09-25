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