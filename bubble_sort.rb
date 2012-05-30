class Array

  def bubble_sort!
    tap do |array|
      size = length
      size.times do |i|
        size.times do |j|
          if array[i] > array[j]
            array[i], array[j] = array[j], array[i]
          end
        end
      end
    end
  end

  def fair_bubble_sort!
    tap do |array|
      size = length
      tmp = nil
      i = 0
      while i < size
        j = 0
        while j < size
          if array[i] > array[j]
            tmp = array[i]
            array[i] = array[j]
            array[j] = tmp
          end
          j += 1
        end
        i += 1
      end
    end
  end

end
