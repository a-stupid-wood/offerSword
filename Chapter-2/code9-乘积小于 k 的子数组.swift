/** 题目：乘积小于 k 的子数组
 * 输入一个正整数组成的数组和一个正整数 k，请问数组中有多少个数字乘积小于k的连续子数组？
 */
import Foundation

//MARK: 使用双指针
func numSubarrayProductLessThanK(nums: Array<Int>, k: Int) -> Int {
    var left = 0
    var right = 0
    var count = 0
    var product: UInt64 = 1
    while right < nums.count {
        product *= UInt64(nums[right])
        while left <= right, product >= k {
            product /= UInt64(nums[left])
            left += 1
        }
        //right - left + 1 包含只有right本身的子数组以及前面 right - left 个数跟rihgt之间的连续组合
        count += right >= left ? right - left + 1 : 0
        right += 1
    }
    return count
}
