class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
        el
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
        el
    end

    def dequeue
        @queue.pop
    end
    
    def peek
        @queue[-1]
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        if @map.any? {|k,v| k == key}
            @map[@map.index {|k,v| k == key}][1] = value
        else
            @map << [key, value]
        end
        value
    end

    def get(key)
        return @map[@map.index {|k,v| k == key}][1] if @map.any? {|k,v| k == key}
        nil
    end

    def delete(key)
        @map.delete_at(@map.index {|k,v| k == key}) if @map.any? {|k,v| k == key}
        nil
    end

    def show
        @map
    end
end 