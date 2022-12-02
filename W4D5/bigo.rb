
def slug(arr)  #O(n^2)
    big = ""
    arr.each do |ele|
        arr.each do |ele2|
            big = ele if ele.length > ele2.length
        end
    end
    big
end

def dominant(arr) #O(n log n)
    len = arr.length - 1
    sorted = false
    until sorted
        sorted = true
        (0...len).each do |idx|
            if arr[idx].length > arr[idx + 1].length
              arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
              sorted = false
            end
        end
    end
    arr[-1]
end

def clever(arr) #O(n)
    len = 0
    idex = 0
    arr.each_with_index do |ele, idx|
        if ele.length > len
            len = ele.length
            idex = idx
        end
    end
    arr[idex]
end

def slow_dance(direction, tiles_array) #o(n)
    tiles_array.each_with_index do |ele, idx|
        return idx if ele == direction
    end
    nil
end

def fast_dance(direction, new_tiles_data_structure) #o(1) ? not sure
    new_tiles_data_structure.index(direction)
end


a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

p slug(a)
p dominant(a)
p clever(a)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up" ]

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

p fast_dance("up", tiles_array)
p fast_dance("right-down", tiles_array)