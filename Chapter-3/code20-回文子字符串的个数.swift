/** 题目：回文子字符串的个数
 * 给定一个字符串，请问该字符串中有多少个回文连续子字符串
 */
import Foundation

//MARK: 双指针
func countSubstrings(s: String) -> Int {
    if s.isEmpty {
        return 0
    }
    
    var count = 0
    for i in 0..<s.count {
        count += countPalindrome(s: s, start: i, end: i) //以下标为 i 为字符为中间的奇数回文数
        count += countPalindrome(s: s, start: i, end: i + 1) // 以下标为 i 和 i + 1 为字符为中间的偶数回文数
    }
    return count
}


func countPalindrome(s: String, start: Int, end: Int) -> Int {
    var left = start
    var right = end
    var count = 0
    while left >= 0 && right < s.count && s[s.index(s.startIndex, offsetBy: left)] == s[s.index(s.startIndex, offsetBy: right)] {
        count += 1
        left -= 1
        right += 1
    }
    return count
}
