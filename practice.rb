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
