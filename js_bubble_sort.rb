require 'v8'

class JSBubbleSort
  def initialize
    context = ::V8::Context.new
    context.load 'bubble_sort.js'
    @context = context
  end

  def bubble_sort array
    context = @context
    context['array'] = array
    context.eval 'array.bubbleSort()'
    ::Array.try_convert context['array']
  end
end

