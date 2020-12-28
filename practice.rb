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

# binarysearch.io 'length of a linked list' (javascript solution)
class LLNode {
    constructor(val, next=null) {
        this.val = val
        this.next = next
    }
}
 
solve(node) {
    let length = 0
    while (node != null) {
        length++
        node = node.next
    }
    return length
}

let node = 350
solve(node) # 1

let node = 12 -> 93 -> 27
solve(node) # 3

# binarysearch.io 'string isomorphism'
def solve(s, t)
    if s.length != t.length
        return false
    end
    hash = Hash.new {|h, k, v| hash[k] = v}

    (0...s.length).each do |i|
        if !hash[s[i]] && !hash.values.include?(t[i])
            hash[s[i]] = t[i]
        elsif hash[s[i]] != t[i]
            return false
        end
    end
    true
end

solve('cat', 'foo') # false

# binarysearch.io 'IP Address'
def solve(s)
    s.each_char do |char|
        if !"0123456789.".include?(char)
            return false
        end
    end
    arr = s.split(".")
    if arr.length != 4
        return false
    end
    arr.each do |el|
        if !(el.to_i.is_a? Integer) || el.to_i > 255 || ("a".."z").include?(el)
            return false
        end
        if el.length > 1 && el[1..-1].include?("0")
            return false
        end
    end
    true

end

solve("0.1.2.256") # false
solve("0.1.2.+1") # false
solve("00.1.2.3") # false

# binarysearch.io 'flight itinerary'
# You are given a list of flights that were taken, represented as origin to destination airport pairs. Given that this list was shuffled, find all the airports that were visited in the correct order.


# binarysearch.io 'minimum initial value for positive prefix sum'
class Solution
    def solve(nums)
        not_done = true

        min = 0
        sum = 0

        while not_done
            not_done = false
            
            nums.each_with_index do |num, idx|
                sum += min
                sum += num
                if sum < 0 
                    not_done = true
                    break
                end
                if sum >= 0 && idx == nums.length-1
                    return min
                end
            end
            min += 1
            break
        end  
            

    end
end


# binarysearch.io 'add one'
def solve(nums)
    return (nums.join("").to_i + 1).to_s.split("").map {|n| n.to_i}
end

solve([1, 9, 1]) # [1, 9, 2]

# binarysearch.io 'pythagorean triplets'
def solve(nums)
    arr = nums.map {|num| num * num}
    arr.each_with_index do |el1, idx1|
        arr.each_with_index do |el2, idx2|
            if idx2 > idx1
                if arr.include?(el1 + el2)
                    if (arr.index(el1 + el2) != idx1) && (arr.index(el1 + el2) != idx2)
                        return true
                    end
                end
            end
        end
    end
    false
end

solve([5, 1, 7, 4, 3]) # true


# binarysearch.io 'rotate list left by k'
def solve(nums, k)
    k.times do
        nums.push(nums.shift)
    end
    return nums
end

solve ([1, 2, 3, 4, 5, 6], 2) # [3, 4, 5, 6, 1, 2]

# binary search.io 'rotate'
def solve(n, k)
    k.times do
        nums.push(nums.shift)
    end
    return nums
end

# binarysearch.io 'flip and invert matrix' (javascript)
solve(matrix) {
    return matrix.map(sub => sub.reverse().map(el => el === 0 ? el = 1 : el = 0))
}

matrix = [
    [1, 1, 0],
    [0, 0, 1],
    [0, 0, 0]
]
solve(matrix)   #[
                #   [1, 0, 0],
                #   [0, 1, 1],
                #   [1, 1, 1]
                # ]

# binarysearch.io 'mixed sorting'
solve(nums) {
    const even = nums.filter(x => x % 2 === 0).sort()
    const odd = nums.filter(x => x % 2 != 0).sort().reverse()
    return nums.map(n => {
        if (n % 2 === 0) {
            return even.shift()
        } else {
            return odd.shift()   
        }
    })
}
solve([8, 13, 11, 90, -5, 4]) # [4, 13, 11, 8, -5, 90]

# binarysearch.io 'consecutive duplicates' partial solution
def solve(s)
    answer = ""
    (0...s.length - 1).each do |idx|
        if s[idx] != s[idx + 1]
            answer += s[idx]
        end
        if idx == s.length - 2 && s[idx] == s[idx + 1]
            answer += s[idx]
        end
    end
    return answer
end


# binarysearch.io 'sum of two number'
solve(nums, k) {
    let hashmap = {}
    for (let i = 0; i < nums.length; i++) {

        let diff = k - nums[i];

        if (hashmap[diff] != null) {
            return true
        } else {
            hashmap[nums[i]] = diff
        }

    }
    return false
}
solve([35, 8, 18, 3, 22], 11) // true

# binarysearch.io 'Remove last duplicate entries'
def solve(nums)
    answer = []
    hash = Hash.new {|h, k| h[k] = [] }
    
    nums.each_with_index do |num, idx|
        hash[num].push(idx)
    end
    
    hash.each do |k, v|
        if v.length > 1
            v.pop()
        end
    end
    
    hash.values.flatten.sort.each do |idx|
        answer.push(nums[idx])
    end
    return answer
end

solve([3, 3, 0, 3, 3, 0, 1]) # [3, 3, 0, 3, 1]

## python solution
def solve(self, nums):
    dict = {}
    
    new_nums = []
    
    for idx, num in enumerate(nums, start=0):
        if num not in dict:
            dict[num] = []
            dict[num].append(idx)
        else:
            dict[num].append(idx)
            
    for v in list(dict.values()):
        if len(v) > 1:
            v.pop()
            
    flattened = []
    
    for sub in list(dict.values()):
        for item in sub:
            flattened.append(item)
            
    for idx in sorted(flattened):
        new_nums.append(nums[idx])
        
    return new_nums
        
solve([1, 3, 4, 1, 3, 5]) # [1, 3, 4, 5]

# binarysearch.io 'pattern to word bijection'
# Given two strings s and p, return whether s follows the pattern in p. That is, return whether each character in p can map to a non-empty word such that it maps to s.
def solve(s, p)
    s_arr = s.split(" ")
    p_arr = p.split("")
    
    if s_arr.length != p_arr.length
        return false
    end
    
    hash = Hash.new {|h, k, v| h[k] = v}
    
    (0...s_arr.length).each do |i|
        if !hash[s_arr[i]] && !hash.values.include?(p_arr[i])
            hash[s_arr[i]] = p_arr[i]
        end
        if hash[s_arr[i]] && hash[s_arr[i]] != p_arr[i]
            return false
        end
        if !hash[s_arr[i]] && hash.values.include?(p_arr[i])
            return false
        end
    end
    return true
end
solve("hello world world world hello", "abbba")

# binarysearch.io 'pair sums'
def solve(self, nums):
    evens = 0
    odds = 0
    
    for n in nums:
        if n % 2 == 0:
            evens += 1
        else:
            odds += 1
            
    return evens * odds

solve([3, 2, 4]) # 2

# binarysearch 'interleaved string'
# js solution
solve(s0, s1) {
    let new_str = ""
    for(let i = 0; i < s0.length || i < s1.length; i++) {
        if (s0[i]) {
            new_str += s0[i]
        }
        if (s1[i]) {
            new_str += s1[i]
        }
    }
    return new_str
}
solve('abc', 'xyz') // 'axbycz'

# python solution
def solve(self, s0, s1):
    new_str = ''
    
    longest = len(max([s0, s1], key=len))
    for x in range(longest):
        if x < len(s0):
            new_str += s0[x]
        if x < len(s1):
            new_str += s1[x]
            
    return new_str
    
solve('abc', 'xyz') # 'axbycz'


# binary search 'compress string'
def solve(s)
    new_str = ''
    s.each_char do |char|
        if new_str[-1] != char
            new_str += char
        end
    end
    return new_str
end
solve('aaaaaabbbbccccaaaaddf') # 'abcadf'

# binary search 'big numbers'
# Given a two-dimensional integer matrix, return the total number of integers whose value is the largest in its row and in its column. For example, given
def solve(matrix)
    
    count = 0
    (0...matrix.length).each do |i1|
        largest_row_idx = matrix[i1].index(matrix[i1].max)
        unless matrix[i1].max < matrix[i1][largest_row_idx]
            count += 1
        end
            
    end
    return count     
end

# binarysearch '3-6-9'
def solve(n)
    answer = []
    (1..n).each do |num|
        if num % 3 == 0 || num.to_s.include?('3') || num.to_s.include?('6') || num.to_s.include?('9')
            answer.push('clap')
        else
            answer.push(num.to_s)
        end
    end
    
    return answer
end
solve(16) # ["1", "2", "clap", "4", "5", "clap", "7", "8", "clap", "10", "11", "clap", "clap", "14", "clap", "clap"]

# javascript solution
solve(n) {
    let answer = []
    for(let i = 1; i <= n; i++) {
        if (i % 3 === 0 || i.toString().includes('3') || i.toString().includes('6') || i.toString().includes('9')) {
            answer.push('clap')
        } else {
            answer.push(i.toString())
        }
    }
    return answer
}
solve(16) # ["1", "2", "clap", "4", "5", "clap", "7", "8", "clap", "10", "11", "clap", "clap", "14", "clap", "clap"]
 
# python solution
def solve(self, n):
    answer = []
    for i in range(1, n + 1):
        if i % 3 == 0 or '3' in str(i) or '6' in str(i) or '9' in str(i):
            answer.append('clap')
        else:
            answer.append(str(i))
    
    return answer

solve(16) # ["1", "2", "clap", "4", "5", "clap", "7", "8", "clap", "10", "11", "clap", "clap", "14", "clap", "clap"]
    

# binarysearch.io 'chunky strings'

def solve(s, n)

end

# binarysearch.io 'camelCase'
# Given a list of strings words, concatenate the strings in camel case format.
def solve(words)
    answer = ""
    words.each_with_index do |word, idx|
        if words.length > 1
            if idx < 1
                answer += (word.downcase)
            else
                answer += (word[0].upcase + word[1..-1].downcase)
            end
        else
            answer += (word.downcase)
        end
    end
    return answer
end
solve(["java", "beans"]) # "javaBeans"

# binarysearch.io 'longest increasing subsequence' partial solution

def solve(nums)
    if nums.length <= 1
        return nums.length
    elsif nums.length == 2 && nums[0] > nums[1]
        return 1
    end
    
    count = 2
    current = nil
    
    (0...nums.length - 1).each do |i|
        if current
            if (nums[i + 1] > nums[i] && nums[i] > current)
                current = nums[i]
                count += 1
            elsif nums[i + 1] < nums[i]
                current = nil
                count = 2
            end
        else
            if nums[i + 1] > nums[i]
                current = nums[i]
                count += 2
            end
        end
    end
    
    return count
end

# binarysearch.io 'largest number by two times'
def solve(nums)
    sorted = nums.sort
    return sorted[-1] > sorted[-2] * 2 ? true : false
end
solve([3, 6, 9]) #false

# binarysearch.io 'subsequence strings'
def solve(s1, s2)
    s1_arr = s1.split('')
    s2.each_char do |char|
        char == s1_arr[0] ? s1_arr.shift : nil
    end
    return s1_arr.length == 0 ? true : false
end
solve('ale', 'apple') #true

# binarysearch.io 'generate primes'
def solve(n)
    primes = []
    (2..n).each do |num|
        if prime?(num)
            primes.push(num)
        end
    end
    return primes
end

# helper function
def prime?(n)
    return false if n < 2
    (2...n).each do |num|
        if n % num == 0
            return false
        end
    end
    return true
end

solve(10) # [2, 3, 5, 7]

# binarysearch.io  'rain catcher'
# You are given a list of non-negative integers nums where each element represents the height of a hill. Suppose it will rain and all the spaces between two sides get filled up.
# Return the amount of rain that would be caught between the hills.

def solve(nums)

end

# binarysearch.io 'make strings same'
def solve(s, t)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    s.each_char do |char|
        hash1[char] += 1
    end
    t.each_char do |char|
        hash2[char] += 1
    end
    hash1 == hash2
end


# algoexpert 'Two Number Sum'
# Write a function that takes in a non-empty array of distinct integers and an integer representing a target sum.  
# If any two numbers in the input array sum up to the target sum, the function should return them in an array, in any order.  
# If no two numbers sum up to the target sum, the function should return an empty array.

# arguments
let array = [3, 5, -4, 8, 11, 1, -1, 6]
let target = 10

# Solution 1
# Time Complexity: O(n^2) - quadratic
# Space Complexity: O(1) - constant
const twoSum1 = (array, target) => {
  # nested 'for' loop (iterating through array TWICE is not very efficient)
  for(let i = 0; i < array.length; i++) {  
    for(let j = 0; j < array.length; j++) {
      if (j > i && array[i] + array[j] == target) {
        return [array[i], array[j]]
      }
    }
  }
  return []
}
console.log(twoSum1(array, target)) // answer: [11, -1]

# Solution 2 
# (optimized time complexity at the expense of some space complexity)
# Time Complexity: O(n) - linear    
# Space Complexity: O(n) - linear
const twoSum2 = (array, target) => {
  let hash = {}
  # single 'for loop (iterating through array ONCE is more efficient)
  for(let i = 0; i < array.length; i++) {  
    let x = array[i]
    let y = target - x
    if (hash[y]) {
      return [y, x]
    } else {
      hash[x] = true
    }
  }
  return []
}
console.log(twoSum2(array, target)) // answer: [11, -1]

# binarysearch 'rotation of another string'
def solve(s0, s1)
    # shift and push the first letter of the array length number of times
    # check if s0 == s1 each time
    return true if s0 == s1
    
    rotations = s0.length
    
    s0_arr = s0.split('')
    s1_arr = s1.split('')
    until s0_arr == s1_arr || rotations == 0
        s0_arr == s0_arr.push(s0_arr.shift)
        rotations -= 1
        return true if s0_arr == s1_arr
    end
    return false
end
solve("Cattywampus", "sCattywampu") # true

# binarysearch.io 'group string into chunks'
def solve(s, n)
    answer = []
    
    while s.length > 0
        answer.push(s[0...n])
        s[0...n] = ''
    end
    return answer
end
s = "abcdefg"
n = 3
solve(s, n) # ["abc", "def", "g"]

# algoexpert 'validate subsequence'
function isValidSubsequence(array, sequence) {
  # Write your code here.
	array.forEach(el => {
		if (el == sequence[0]) {
			sequence.shift()
		}
	})
	return sequence.length == 0 ? true : false
}
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, -1, 10]
isValidSubsequence(array, sequence) # true

# binarysearch.io '3 and 7'
def solve(n)
    x = 0
    while x <= n
        if (n - x) % 3 == 0
            return true
        end
        x += 7
    end
    return false
end
solve(13) # true

# binarysearch.io 'penny for your thoughts'
# Given a positive integer n representing the amount of cents you have, return the formatted currency amount. For example, given n = 123456, return "1,234.56".
# ruby solution
def solve(n)
    if n.to_s.length >= 6
        num = n.to_s[0..-3] + '.' + n.to_s[-2..-1]
        int_length = num.index('.')
        until int_length <= 3
            comma_idx = int_length - 3
            num = num[0...comma_idx] + ',' + num[comma_idx..-1]
            int_length -= 3
        end
        return num
    else
        return (n.to_f / 100).to_s
    end
end
solve(132) # '1.32
solve(100000000) # '1,000,000.00'

# javascript solution
solve(n) {
    let nString = n.toString()
    let nFloat = nString.slice(0, nString.length - 2) + '.' + nString.slice(nString.length - 2, nString.length)
    let intLength = nFloat.indexOf('.')
    if (nString.length >= 6) {
        for(let i = intLength; i > 3; i-=3) {
            let commaIdx = i - 3
            nFloat = nFloat.slice(0, commaIdx) + ',' + nFloat.slice(commaIdx, nFloat.length)
        }
        return nFloat
    } else {
        return (n / 100).toString()
    }
}

# leetcode '28. implement strStr()'
# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack. Return 0 if needle is an empty string.
var strStr = function(haystack, needle) {
    if (needle.length == 0) return 0
    return haystack.indexOf(needle)
};
let haystack = 'hello'
let needle = 'll'
strStr(haystack, needle) # 2

# binarysearch.io 'longest common prefix'
def solve(words)
    x = 0
    while x < words.max.length
        equal = words.all? do |word|
            word[0..x] == words[0][0..x]
        end
        if equal == false
            return words[0][0...x]
        end
        x += 1
    end
end
words = ["anthony", "ant", "antigravity"]
solve(words) # 'ant'

# binarysearch.io 'string clockwise shift' - partial solution
def solve(a, b, k)
    alpha = ('a'..'z').to_a
    a.each_char.with_index do |char, idx|
        temp = char
        until temp == b[idx]
            k -= 1
            temp = alpha[(alpha.index(temp) + 1) % alpha.length]
        end
    end
    return k >= 0
end
solve("xyz", "zzz", 3) # true