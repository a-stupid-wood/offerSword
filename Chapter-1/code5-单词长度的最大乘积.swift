/** 题目：单词长度的最大乘积
 * 输入一个字符串数组 words，请计算不包含相同字符的两个字符串 words[i] 和 words[j] 的长度乘积的最大值。如果所有字符串都包含至少一个相同字符，那么返回 0。假设字符串中只包含英文小写字母
 */

import Foundation

//func maxProduct(words: Array<String>) -> Int {
//    var flags = Array(repeating: Array(repeating: 0, count: 26), count: words.count)
//    let minAsciiValue = Character("a").asciiValue ?? 0
//    for i in 0..<words.count {
//        for ch in words[i] {
//            let asciiValue = ch.asciiValue ?? minAsciiValue
//            flags[i][Int(asciiValue - minAsciiValue)] |= 1
//        }
//    }
//
//    var result = 0
//    for i in 0..<words.count {
//        for j in (i + 1)..<words.count {
//            var k = 0
//            while k < 26 {
//                if flags[i][k] & flags[j][k] == 1 {
//                    break
//                }
//                k += 1
//            }
//            if k == 26 {
//                result = max(result, words[i].count * words[j].count)
//            }
//        }
//    }
//    return result
//}

//优化 使用二进制数位
func maxProduct(words: Array<String>) -> Int {
    var flags = Array(repeating: 0, count: words.count)
    let minAsciiValue = Character("a").asciiValue ?? 0
    for i in 0..<words.count {
        for ch in words[i] {
            let asciiValue = ch.asciiValue ?? minAsciiValue
            flags[i] = (flags[i] << (asciiValue - minAsciiValue)) | 1
        }
    }
    
    var result = 0
    for i in 0..<words.count {
        for j in (i + 1)..<words.count {
            if flags[i] & flags[j] == 0 {
                result = max(result, words[i].count * words[j].count)
            }
        }
    }
    return result
}
