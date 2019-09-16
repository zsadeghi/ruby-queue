class Myqueue
    def initialize
        @underlying_array = []
    end

    def enqueue(a)
        @underlying_array << a
        size
    end

    def size
        @underlying_array.length
    end

    def dequeue
        raise "queue is empty" if size == 0
        @underlying_array.shift
    end
end 