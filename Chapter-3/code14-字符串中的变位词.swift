/** 题目：字符串中的变位词
 * 输入字符串 s1 和 s2，如何判断字符串 s2 中是否包含字符 s1 的某个变位词？如果字符串 s2 中包含字符串 s1 的某个变位词，则字符串 s1 至少有一个变位词是字符串 s2 的子字符串。假设两个字符串中只包含英文小写字母。例如，字符串 s1 为 “ac”，字符串 s2 为 “dgcaf”，由于字符串 s2 中包含字符串 s1 的变位词 “ca”，因此输出为 true。如果字符串 s1 为 “ab”，字符串 s2 为 “dgcaf”，则输出为 false
 */
import Foundation

//MARK: 时间复杂度：O(m + n) 空间复杂度 O(1)
func checkInclusion(s1: String, s2: String) -> Bool {
    if s2.count < s1.count {
        return false
    }
    
    var counts = Array(repeating: 0, count: 26)
    let minAsciiValue = Character("a").asciiValue ?? 0
    for i in 0..<s1.count {
        counts[Int((Character("\(s1[s1.index(s1.startIndex, offsetBy: i)])").asciiValue ?? minAsciiValue) - minAsciiValue)] += 1
        counts[Int((Character("\(s2[s2.index(s2.startIndex, offsetBy: i)])").asciiValue ?? minAsciiValue) - minAsciiValue)] -= 1
    }
    
    if areAllZero(counts: counts) {
        return true
    }
    
    for i in s1.count..<s2.count {
        counts[Int((Character("\(s2[s2.index(s2.startIndex, offsetBy: i)])").asciiValue ?? minAsciiValue) - minAsciiValue)] -= 1
        counts[Int((Character("\(s2[s2.index(s2.startIndex, offsetBy: i - s1.count)])").asciiValue ?? minAsciiValue) - minAsciiValue)] += 1
        if areAllZero(counts: counts) {
            return true
        }
    }
    return false
}

func areAllZero(counts: Array<Int>) -> Bool {
    for count in counts {
        if count != 0 {
            return false
        }
    }
    return true
}
