/** 题目：有效的回文
 * 给定一个字符串，请判断它是不是回文。假设只需要考虑字母和数字字符，并忽略大小写
 */
import Foundation

//MARK: 双指针 时间复杂度 O(n)  空间复杂度 O(1)
func isPalindrome(s: String) -> Bool {
    var left = 0
    var right = s.count - 1
    while left < right {
        var ch1 = s[s.index(s.startIndex, offsetBy: left)]
        var ch2 = s[s.index(s.startIndex, offsetBy: right)]
        if isLetterOrDigit(ch: ch1) {
            left += 1
        } else if isLetterOrDigit(ch: ch2) {
            right -= 1
        }else {
            ch1 = Character(ch1.lowercased())
            ch2 = Character(ch2.lowercased())
            if ch1 != ch2 {
                return false
            }
            left += 1
            right -= 1
        }
    }
    return true
}

func isLetterOrDigit(ch: Character) -> Bool {
    switch ch {
    case "0"..."9", "a"..."z", "A"..."Z":
        return true
    default:
        return false
    }
}
