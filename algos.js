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