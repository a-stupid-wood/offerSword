/** 题目：只出现一次的数字
 * 输入一个整数数组，数组中只有一个数字出现了一次，而其他数字都出现了 3 次， 请找出那个只出现一次的数字
 */

import Foundation

func singleNumber(nums: Array<Int>) -> Int {
    var bitSums = Array(repeating: 0, count: 64)
    for num in nums {
        for i in 0..<64 {
            bitSums[i] += (num >> (63 - i)) & 1
        }
    }
    var result = 0
    for i in 0..<64 {
        result = (result << 1) + bitSums[i] % 3
    }
    return result
}
