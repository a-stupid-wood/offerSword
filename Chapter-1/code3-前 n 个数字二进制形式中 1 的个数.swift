/** 题目：前 n 个数字二进制形式中 1 的个数
 * 输入一个非负数n，请计算 0 到 n 之间每个数字的二进制形式中 1 的个数，并输出一个数组
 */

import Foundation

//func countBits(n: Int) -> Array<Int> {
//    var result = Array(repeating: 0, count: n + 1)
//    for i in 0...n {
//        var j = i
//        while j != 0 {
//            result[i] += 1
//            j = j & (j - 1)
//        }
//    }
//    return result
//}


//优化
//func countBits(n: Int) -> Array<Int> {
//    var result = Array(repeating: 0, count: n + 1)
//    for i in 0...n {
//        result[i] = result[i & (i - 1)] + 1
//    }
//    return result
//}

//利用 i/2
func countBits(n: Int) -> Array<Int> {
    var result = Array(repeating: 0, count: n + 1)
    for i in 0...n {
        result[i] = result[i >> 1] + (i & 1)
    }
    return result
}
