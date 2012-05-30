require 'benchmark'

module Test
  include Benchmark

  def self.benchmark tasks
    ::Benchmark.benchmark CAPTION, 7, FORMAT, ">total:", ">avg:" do |benchmark|
      common_array = random_array
      tasks.inject nil do |result, (name, task)|
        current_result = nil
        array = common_array.dup
        benchmark.report name do
          current_result = task.call array
        end
        raise [current_result, result].inspect if result && result != current_result
        current_result
      end
    end
  end
end

def random_array length = 10 ** 6
  [].tap do |array|
    length.times do
      array << rand(10 ** 6)
    end
  end
end

require_relative 'js_bubble_sort'
js_bubble_sort = JSBubbleSort.new

require_relative 'c_bubble_sort'

require_relative 'bubble_sort'

algorithms = {
  js: proc{ |array|
    js_bubble_sort.bubble_sort array
  },
  c: proc{ |array|
    CBubbleSort.bubble_sort array
  },
  ruby: proc{ |array|
    array.fair_bubble_sort!
  }
}

Test.benchmark algorithms
