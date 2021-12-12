/** 题目：二进制加法
 * 输入两个表示二进制的字符串，请计算它们的和，并以二进制字符串的形式输出。
 */

import Foundation

func addBinary(a: String, b: String) -> String {
    var result = ""
    var i = a.count - 1
    var j = b.count - 1
    var carry = 0
    while i >= 0 || j >= 0 {
        let digitA = i >= 0 ? (Int("\(a[a.index(a.startIndex, offsetBy: i)])") ?? 0) : 0
        let digitB = j >= 0 ? (Int("\(b[b.index(b.startIndex, offsetBy: j)])") ?? 0) : 0
        var sum = digitA + digitB + carry
        carry = sum >= 2 ? 1 : 0
        sum = sum >= 2 ? sum - 2 : sum
        result += "\(sum)"
        i -= 1
        j -= 1
    }
    if carry == 1 {
        result += "1"
    }
    return String(result.reversed())
}
