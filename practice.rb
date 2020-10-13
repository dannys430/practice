# two sum
def two_sum(arr, target) 
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      if idx2 > idx1 && el1 + el2 == target
        return [idx1, idx2]
      end
    end
  end
end

matchTarget([2, 7, 11, 15], 9)  # [0, 1]

# running sum
def running_sum(nums)
   answer = [nums[0]]
    i = 1
    while i < nums.length
        answer.push(answer[-1] + nums[i])
        i += 1
    end
    return answer
end

running_sum([1, 2, 3, 4]) # [1, 3, 6, 10]

# 1431. kids with candies
def kids_with_candies(candies, extra_candies)
    max = candies.max
    greatest = []
    candies.each do |candy|
        candy + extra_candies >= max ? greatest.push(true) : greatest.push(false)
    end
    return greatest
end

kids_with_candies([2, 3, 5, 1, 3], 3) # [true, true, true, false, true]

# 1108. defanging ip address
def defang_i_paddr(address)
    return address.split('.').join('[.]')
end

defang_i_paddr('1.1.1.1') # '1[.]1[.]1[.]1'

# 1470. shuffle the array
def shuffle(nums, n)
    answer = []
    nums.each_with_index do |num, idx|
        if (idx < nums.length - n)
            answer.push(num)
            answer.push(nums[idx + n])
        end
    end
    return answer
end

shuffle([2, 5, 1, 3, 4, 7], 3) # [2, 3, 5, 4, 1, 7]

# hackerrank 'compare the triplets'
def compareTriplets(a, b)
    a_points = 0
    b_points = 0
    x = 0
    while x < a.length
        if a[x] != b[x]
            a[x] > b[x] ? a_points += 1 : b_points += 1
        end
        x += 1
    end
    return [a_points, b_points]
end

compareTriplets([5, 6, 7], [3, 6, 10]) # [1, 1]

# binarysearch.io 'domino placement'
def solve(n, m)
    board = n * m
    if board.odd?
        board -= 1
    end
    return board / 2
end

solve(2, 2)

# binarysearch.io 'anagram checks'
def solve(s0, s1)
    if s0.length != s1.length
        return false
    end
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    
    s0.each_char do |c1|
        hash1[c1] += 1
    end
    
    s1.each_char do |c2|
        hash2[c2] += 1
    end
    
    hash1 == hash2
end

solve("listen", "silent") # true

# binarysearch.io 'string expansion' - partial solution
def solve(s)
    answer = ""
    arr = s.split('')
    hash = Hash.new(0)
    arr.each_with_index do |el, idx|
        if el.to_i >= 1
            if arr[idx + 1] == "("
                el.to_i.times do 
                    if arr[idx + 2].to_i >= 1
                        if arr[idx + 3] == "("
                            arr[idx + 2].to_i.times do 
                                    answer += (arr[(idx + 4)...arr.index(")")].join(''))
                            end
                        end
                    end
                    answer += (arr[(idx + 2)...arr.index(")")].join(''))
                end
                
                # hash[arr[idx + 1]] += 1
            end
        end
        
    end
    return answer
end

# binarysearch.io 'greatest common divisor'
def solve(nums)
    largest = nums.sort[-1]
    until nums.all? {|num| num % largest == 0 }
        largest -= 1
    end
    return largest
end

solve([6, 12, 9]) # 3

# binarysearch.io 'making pizza'
class Solution
    def solve(s)
        hash = Hash.new(0)
        
        if s.include?('p') && s.include?('i') && s.include?('z') && s.include?('a')
            s.each_char do |char|
                if "pia".include?(char)
                    hash[char] += 1
                elsif "z".include?(char)
                    hash[char] += 0.5
                end
            end
        end
       
        if hash['p'] >= 1 && hash['i'] >= 1 && hash['z']  >= 1 && hash['a'] >= 1
            return hash.values.min.floor
        else
            return 0
        end

    end
end

solve("pihzzatpizza") # 2

# binarysearch.io 'sorted elements'
def solve(nums)
    count = 0
    nums_sorted = nums.sort
    x = 0
    while x < nums.length
        if nums[x] == nums_sorted[x]
            count += 1
        end
        x += 1
    end
    return count
end

solve([1, 7, 3, 4, 10]) # 2

# binarysearch.io 'word formation' - partial solution
def solve(words, letters)
    hash = Hash.new(0)
    hash2 = Hash.new(0)
    letters.each_char do |char|
        hash[char] += 1
    end
    
    longest = 0
    
    words.each_with_index do |word, idx|
        word.each_char.with_index do |char, idx|
            if !hash[char] || hash[char] <= 0
                next
            end
            if hash[char] > 0
                hash[char] -= 1
            end
        end
        
    end
    return longest
end

# binarysearch.io 'hip to be square'
def solve(nums)
    squared = nums.map {|num| num * num}
    return squared.sort
end

solve([-9, -2, 0, 2, 3]) # [0, 4, 4, 9, 81]
