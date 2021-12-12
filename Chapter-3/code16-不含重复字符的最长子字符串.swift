/** 题目：不含重复字符的最长子字符串
 * 输入一个字符串，求该字符串中不含重复字符的最长子字符串的长度
 */
import Foundation

//MARK: 双指针
func lengthOfLongestSubstring(s: String) -> Int {
    if s.isEmpty {
        return 0
    }
    //assii 码总共有 256 个
    var counts = Array(repeating: 0, count: 256)
    var right = 0
    var left = -1
    var longest = 1
    while right < s.count {
        counts[Int(Character("\(s[s.index(s.startIndex, offsetBy: right)])").asciiValue ?? 0)] += 1
        while hasGreaterThan1(counts: counts) {
            left += 1
            counts[Int(Character("\(s[s.index(s.startIndex, offsetBy: left)])").asciiValue ?? 0)] -= 1
        }
        longest = max(longest, right - left)
        right += 1
    }
    return longest
}

func hasGreaterThan1(counts: Array<Int>) -> Bool {
    for count in counts {
        if count > 1 {
            return true
        }
    }
    return false
}
