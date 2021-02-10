// 'Two Sum'
//  Write a function that takes in a non-empty array of distinct integers 
//  and an integer representing a target sum.  
//  If any two numbers in the input array sum up to the target sum, 
//  the function should return them in an array, in any order.  
//  If no two numbers sum up to the target sum, the function should return an empty array.

// arguments
let array = [3, 5, -4, 8, 11, 1, -1, 6]
let target = 10

// Solution 1
// Time Complexity: O(n^2) - quadratic
// Space Complexity: O(1) - constant
const twoSum1 = (array, target) => {
  // nested 'for' loop (iterating through array TWICE is not very efficient)
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

// Solution 2 
// (optimized time complexity at the expense of some space complexity)
// Time Complexity: O(n) - linear    
// Space Complexity: O(n) - linear
const twoSum2 = (array, target) => {
  let hash = {}
  // single 'for loop (iterating through array ONCE is more efficient)
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

// algoexpert.io 'three number sum'
function threeNumberSum(array, targetSum) {
	let answer = []
	let sorted = array.sort((a, b) => a - b)
	for(let i = 0; i < sorted.length - 2; i++) {
		let left = i+1
		let right = sorted.length - 1
		while(left < right) {
			let subArr = [sorted[i], sorted[left], sorted[right]]
			let sum = subArr.reduce((a, b) => a + b)
			if(sum === targetSum) {
				answer.push(subArr)
				left++
				right--
			} else if(sum < targetSum) {
				left++
			} else if(sum > targetSum) {
				right--
			}
		}
	}
	return answer
}
const array = [12, 3, 1, 2, -6, 5, -8, 6]
const target = 0
console.log(threeNumberSum(array, target)) // [[-8, 2, 6], [-8, 3, 5], [-6, 1, 5]]

// binarysearch.io 'Repeated Addition' 
const solve = (n) => {
    if(n.toString().split('').reduce((a,b) => parseInt(a) + parseInt(b)) >= 10) {
        n = n.toString().split('').reduce((a,b) => parseInt(a) + parseInt(b))
        return this.solve(n)
    } else {
        return n.toString().split('').reduce((a,b) => parseInt(a) + parseInt(b))
    }
}
solve(8835) // 6

// algoexpert 'Branch Sums' javascript solution
class BinaryTree {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

const branchSums = (root) => {
  // Write your code here.
	let sums = []
	calculateBranchSums(root, 0, sums)
	return sums
}

const calculateBranchSums = (node, runningSum, sums) => {
	let newRunningSum = node.value + runningSum
	if(node.left === null && node.right === null) {
		sums.push(newRunningSum)
		return
	}
	
	if(node.left) calculateBranchSums(node.left, newRunningSum, sums)
	if(node.right) calculateBranchSums(node.right, newRunningSum, sums)
}

let tree = 
{
  "tree": {
    "nodes": [
      {"id": "1", "left": "2", "right": "3", "value": 1},
      {"id": "2", "left": "4", "right": "5", "value": 2},
      {"id": "3", "left": "6", "right": "7", "value": 3},
      {"id": "4", "left": "8", "right": "9", "value": 4},
      {"id": "5", "left": "10", "right": null, "value": 5},
      {"id": "6", "left": null, "right": null, "value": 6},
      {"id": "7", "left": null, "right": null, "value": 7},
      {"id": "8", "left": null, "right": null, "value": 8},
      {"id": "9", "left": null, "right": null, "value": 9},
      {"id": "10", "left": null, "right": null, "value": 10}
    ],
    "root": "1"
  }
}
branchSums(root) // [15, 16, 18, 10, 11]

// binarysearch.io 'longest consecutive duplicate string'
solve(s) {
    if(!s.length) return 0
    let lengthsArr = []
    let length = 1

    let i = 0
    while(i < s.length) {
        let char = s[i]
        if(char === s[i+1]) {
            length += 1
        } else if(char !== s[i+1]) {
            lengthsArr.push(length)
            char = s[i+1]
            length = 1
        }
        i++
    }
    return Math.max(...lengthsArr)
}
solve('aaabbbb') // 4


// binarysearch.io 'max product of two numbers'
const solve = (nums) => {
    if (nums.length === 1) return nums[0]
    if (nums.length === 2) return nums[0] * nums[1]
    let sorted = nums.sort((a, b) => a - b)
    let max = sorted[sorted.length - 1] * sorted[sorted.length - 2]
    let min = sorted[0] * sorted[1]
    return max > min ? max : min
}
solve([5, 1, 7]) // 35

// binarysearch.io 'removing parenthesis'
const solve = (s) => {
    let opening = 0
    let invalid = 0

    for(let i = 0; i < s.length; i++) {
        if(opening === 0 && s[i] === ')') {
            invalid += 1
        } else if(opening > 0 && s[i] === ')') {
            opening -= 1
        } else if(s[i] === '(') {
            opening += 1
        }
    }
    return opening + invalid
}
solve('()())()') // 1

// binarysearch.io '123 number flip'
const solve = (n) => {
  const nString = n + ''
  let variations = []
  for(let i = 0; i < nString.length; i++) {
      variations.push(parseInt(nString.slice(0, i) + '3' + nString.slice(i+1, nString.length)))
  }
  return Math.max(...variations)
}
solve(123) // 323

// binarysearch.io 'run length encoding'
const solve = (s) => {
    let answer = ''
    let count = 1
    for(let i = 0; i < s.length; i++) {
        let current = s[i]
        let next = s[i+1]
        if (current === next) {
            count += 1
        } else {
            answer += count.toString() + current
            count = 1
        }
    }
    return answer
}
s = "aaaabbbccdaa"
solve(s) // "4a3b2c1d2a"

// binarysearch.io 'strictly increasing or strictly decreasing'
const solve = (nums) => {
    if (nums.length < 2) return true
    let increasing = null
    for(let i = 0; i < nums.length; i++) {
        let current = nums[i]
        let next = nums[i+1]
        if (next > current && (increasing === null || increasing === true)) {
            increasing = true
            continue
        } else if (next < current && (increasing === null || increasing === false)) {
            increasing = false
            continue
        } else if (next < current && increasing === true) {
            return false
        } else if (next > current && increasing === false) {
            return false
        } else if (current === next) {
            return false
        }
    }
    return true
}
let nums = [1, 2, 3, 4, 5]
solve(nums) // true

// binarysearch.io 'odd number of digits'
const solve = (nums) => {
    let count = 0
    for(let i = 0; i < nums.length; i++) {
        if (nums[i].toString().length % 2 !== 0) {
            count += 1
        }
    }
    return count
}
let nums = [1, 800, 2, 10, 3]
solve(nums) // 4

// binarysearch.io 'ugly number' partial solution
const solve = (n) => {
    if (n === 0) return false
    const primeFactors = [2, 3, 5]
    let firstIteration = true
    for(let i = 2; i <= n; i++) { // 7
        if (i === 2) {
            firstIteration = false
            n = n / 2
            continue
        }
        if (n % i === 0) {
            if (!primeFactors.includes(i) && this.prime(i)) return false
        }
    }
    return true && primeFactors.includes(n)
}

const prime = (num) => {
    for(let i = num - 1; i > 1; i--) {
        if (num % i === 0) return false
    }
    return true
}