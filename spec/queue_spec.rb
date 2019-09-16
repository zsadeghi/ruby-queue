require "rspec"
require "my_queue"

describe Myqueue do
    describe "#initialize" do 
        it "does not take any arguments from the outside" do 
            Myqueue.new
        end
    end

    describe "#enqueue" do
        subject { Myqueue.new }
        it "should take one argument" do
            subject.enqueue(1)
        end
        it "push the argument into the queue" do
            expect(subject.size).to eq(0)
            subject.enqueue(1)
            expect(subject.size).to eq(1)
        end
        it "should return the size of queue" do
            result = subject.enqueue(1)
            expect(result).to eq(1) 
        end  
    end

    describe "#dequeue" do
        subject { Myqueue.new }
        context "when the queue is empty" do
            it "should raise an error" do
                expect{ subject.dequeue }.to raise_error("queue is empty")
            end
        end
        context "when the queue is not empty" do
            before(:each) do
                subject.enqueue(3)
                subject.enqueue(9)
                subject.enqueue(25)
            end
            it "should remove the first element of the queue" do
                expect(subject.size).to eq(3)
                subject.dequeue
                expect(subject.size).to eq(2)
            end
            it "should return the first element of the queue" do
                expect(subject.dequeue).to eq(3)
            end
        end
    end
end