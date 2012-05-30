require 'ffi'

module CBubbleSort
  path = File.expand_path '..', __FILE__
  extend FFI::Library
  ffi_lib %{#{path}/libsort.so}
  attach_function :bubble, [:pointer, :int], :void

  def self.bubble_sort array
    size = array.length
    pointer = ::FFI::MemoryPointer.new size * 4
    pointer.write_array_of_int array
    bubble pointer, size
    pointer.read_array_of_type :int, :read_int, size
  end
end
