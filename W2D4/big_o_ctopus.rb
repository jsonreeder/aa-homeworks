class Array

  def dominant_octopus
    merge_sort.last
  end

  def merge_sort
    return self if length <= 1
    midpoint = length / 2
    left = take(midpoint).merge_sort
    right = drop(midpoint).merge_sort

    Array.merge(left, right)
  end

  def clever_octopus
    longest = ''

    each { |fish| longest = fish if longest.length < fish.length }

    longest
  end

  def self.merge(left, right)
    merged = []

    until left.empty? || right.empty?
      if left.first.length < right.first.length
        merged << left.shift
      else
        merged << right.shift
      end
    end

    merged += left
    merged += right

    merged
  end
end

if __FILE__ == $PROGRAM_NAME
  prey = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh',
          'fsh', 'fiiiissshhhhhh']

  puts 'Dominant octopus:'
  puts prey.dominant_octopus
  puts 'Clever octopus:'
  puts prey.clever_octopus
end
