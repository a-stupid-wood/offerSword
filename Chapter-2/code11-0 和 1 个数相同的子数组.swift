/** 题目：0 和 1 个数相同的子数组
 * 输入一个只包含 0 和 1 的数组，请问如何求 0 和 1 的个数相同的最长连续子数组的长度？
 */
import Foundation

//MARK: 使用累计和  将 0 替换成 -1  时间复杂度 O(n) 空间复杂度 O(n)
func findMaxLen(nums: Array<Int>) -> Int {
    //记录 sum 最早出现的下标
    var sumToIndex = Dictionary<Int, Int>()
    sumToIndex[0] = -1
    var sum = 0
    var maxLen = 0
    for i in 0..<nums.count {
        sum += nums[i] == 0 ? -1 : 1
        if let index = sumToIndex[sum] {
            maxLen = max(maxLen, i - index)
        }else {
            sumToIndex[sum] = i
        }
    }
    return maxLen
}
