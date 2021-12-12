/** 题目：和大于或等于 k 的最短子数组
 * 输入一个正整数组成的数组和一个正整数 k，请问数组中和大于或等于 k 的连续子数组的最短长度是多少？如果不存在所有数字之和大于或等于 k 的子数组，则返回 0。
 */
import Foundation

//MARK: 使用双指针
func minSubArrayLen(k: Int, nums: Array<Int>) -> Int {
    var left = 0
    var right = 0
    var minLen = Int.max
    var sum = 0
    while right < nums.count {
        sum += nums[right]
        while left <= right &&  sum > k{
            minLen = min(minLen, right - left + 1)
            sum -= nums[left]
            left += 1
        }
        right += 1
    }
    return minLen == Int.max ? 0 : minLen
}
