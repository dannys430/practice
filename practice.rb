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