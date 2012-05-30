require 'ffi'
require 'v8'

def generate_arr
  arr = []
  10000.times do
	arr << rand(1000000)
  end
  arr
end
def bubble arr, size
  size.times do |i|
	size.times do |j|
	  if arr[i] > arr[j]
		arr[i], arr[j] = arr[j], arr[i]
	  end
	end
  end
end

module Sort
  path = File.expand_path '..', __FILE__
  extend FFI::Library
  ffi_lib %{#{path}/libsort.so}
  attach_function :sort, [:pointer, :int], :void
  attach_function :bubble, [:pointer, :int], :void
end

arr = generate_arr

ptr = FFI::MemoryPointer.new 10000*4
ptr.write_array_of_int arr
lib = Sort
t = Time.now
lib.bubble(ptr, arr.size)
puts %{c: #{(Time.now - t)} }

arr = generate_arr

t = Time.now
bubble arr, arr.size
puts %{ruby: #{(Time.now - t)} }

arr = generate_arr

V8::Context.new do |cont|
  cont['arr'] = arr
  cont.load("bubble.js")
  t = Time.now
  cont.eval("bubble(arr, arr.length)")
  puts %{js: #{Time.now - t}}
end