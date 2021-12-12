/** 题目：左右两边子数组的和相等
 * 输入一个整数数组，如果一个数字左边的子数组的数字之和等于右边的子数组的数字之和，那么返回该数字的下标，如果存在多个这样的数字，则返回最左边一个数字的下标。如果不存在这样的数字，则返回-1
 */
import Foundation

//MARK: 时间复杂度 O(n)  空间复杂度 O(1)
func privotIndex(nums: Array<Int>) -> Int {
    var total = 0
    for i in 0..<nums.count {
        total += nums[i]
    }
    
    var sum = 0
    for i in 0..<nums.count {
        sum += nums[i]
        if sum - nums[i] == total - sum {
            return i
        }
    }
    return -1
}
