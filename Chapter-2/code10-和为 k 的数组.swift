/** 题目：和为 k 的数组
 * 输入一个整数数组和一个正整数 k，请问数组中有多少个数字之和等于k的连续子数组？
 */
import Foundation

print(subarraySumEqualK(nums: [1, 1, -1, 2, 1], k: 2))

//MARK: 使用累计和
func subarraySumEqualK(nums: Array<Int>, k: Int) -> Int {
    //存储 sum 出现几次
    var sumToCount = Dictionary<Int, Int>()
    sumToCount[0] = 1
    var sum = 0
    var count = 0
    for num in nums {
        sum += num
        if let temp = sumToCount[sum - k] {
            count += temp
        }
        sumToCount[sum] = (sumToCount[sum] ?? 0) + 1
    }
    return count
}
