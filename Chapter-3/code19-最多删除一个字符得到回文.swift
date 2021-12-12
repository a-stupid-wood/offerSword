/** 题目：最多删除一个字符得到回文
 * 给定一个字符串，请判断如果最多从字符串中删除一个字符能不能得到一个回文字符串。
 */
import Foundation

//MARK: 双指针
func validPalindrome(s: String) -> Bool {
    var start = 0
    var end = s.count - 1
    while start < s.count / 2 {
        let ch1 = s[s.index(s.startIndex, offsetBy: start)]
        let ch2 = s[s.index(s.startIndex, offsetBy: end)]
        if ch1 != ch2 {
            break
        }
        start += 1
        end -= 1
    }
    return start == s.count / 2 ||  //整个都遍历完，是回文
    isPalindrome(s: s, start: start + 1, end: end) || //去掉不同的左边字符，看剩下是否中间是否是回文
    isPalindrome(s: s, start: start, end: end - 1) ////去掉不同的右边字符，看剩下是否中间是否是回文
}

func isPalindrome(s: String, start: Int, end: Int) -> Bool {
    var left = start
    var right = end
    while left < right {
        let ch1 = s[s.index(s.startIndex, offsetBy: left)]
        let ch2 = s[s.index(s.startIndex, offsetBy: right)]
        if ch1 != ch2 {
            return false
        }
        left += 1
        right -= 1
    }
    return start >= right
}
