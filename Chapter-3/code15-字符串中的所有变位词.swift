/** 题目：字符串中的所有变位词
 * 输入字符串 s1 和 s2，如何找出字符串 s2 的所有变位词在字符串 s1 中的起始下标？假设两个字符串中只包含英文小写字母。例如，字符串 s1 为 “cbadabacg”，字符串 s2 为 “abc”，字符串 s2 的两个变位词 “cba” 和 “bac‘ 是字符串 s1 中的子字符串，输出它们在 s1 中的起始下标 0 和 5
 */
import Foundation

//MARK: 时间复杂度：O(m + n) 空间复杂度 O(1)
func findAnagrams(s1: String, s2: String) -> Array<Int> {
    var indices = Array<Int>()
    if s1.count < s2.count {
        return indices
    }
    
    var counts = Array(repeating: 0, count: 26)
    let minAsciiValue = Character("a").asciiValue ?? 0
    for i in 0..<s2.count {
        counts[Int((Character("\(s2[s2.index(s2.startIndex, offsetBy: i)])").asciiValue ?? minAsciiValue) - minAsciiValue)] += 1
        counts[Int((Character("\(s1[s1.index(s1.startIndex, offsetBy: i)])").asciiValue ?? minAsciiValue) - minAsciiValue)] -= 1
    }
    
    if areAllZero(counts: counts) {
        indices.append(0)
    }
    
    for i in s2.count..<s1.count {
        counts[Int((Character("\(s1[s1.index(s1.startIndex, offsetBy: i)])").asciiValue ?? minAsciiValue) - minAsciiValue)] -= 1
        counts[Int((Character("\(s1[s1.index(s1.startIndex, offsetBy: i - s2.count)])").asciiValue ?? minAsciiValue) - minAsciiValue)] += 1
        if areAllZero(counts: counts) {
            indices.append(i - s2.count + 1)
        }
    }
    return indices
}

func areAllZero(counts: Array<Int>) -> Bool {
    for count in counts {
        if count != 0 {
            return false
        }
    }
    return true
}
