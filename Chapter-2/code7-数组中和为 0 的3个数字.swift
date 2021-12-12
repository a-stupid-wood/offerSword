/** 题目：数组中和为 0 的3个数字
 * 输入一个数组，如何找出数组中所有和为 0 的 3 个数字的三元组？需要注意的是，返回值中不得包含重复的三元组。例如，在数组 [-1, 0, 1, 2, -1, -4]  中有两个三元组的和为 0，它们分别是 [-1, 0, 1] 和 [-1， -1， 2]
 */

import Foundation

func threeSum(numbers: Array<Int>) -> Array<Array<Int>> {
    var result = Array<Array<Int>>()
    var nums = numbers
    if nums.count > 3 {
        nums = nums.sorted()
        
        var i = 0
        while i < nums.count - 2 {
            let temp = nums[i]
            result.append(contentsOf: twoSum(numbers: nums, i: i, target: -temp))
            while nums[i] == temp && i < nums.count - 2 {
                i += 1
            }
        }
    }
    return result
}

func twoSum(numbers: Array<Int>, i: Int, target: Int) -> Array<Array<Int>> {
    var j = i + 1
    var k = numbers.count - 1
    var result = Array<Array<Int>>()
    while j < k {
        if numbers[j] + numbers[k] == target {
            result.append([numbers[i], numbers[j], numbers[k]])
            let temp = numbers[j]
            while numbers[j] == temp && j < k {
                j += 1
            }
        }else if numbers[i] + numbers[j] < target {
            j += 1
        }else {
            k -= 1
        }
    }
    return result
}
