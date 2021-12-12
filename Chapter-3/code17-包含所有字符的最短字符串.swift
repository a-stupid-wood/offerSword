/** 题目：包含所有字符的最短字符串
 * 输入两个字符串 s 和 t，请找出字符串 s 中包含字符串 t 所有字符的最短子字符串。如果不存在符合条件的子字符串，则返回空字符串“”。如果存在多个符合条件的子字符串，则返回任意一个。
 */
import Foundation

//MARK: 双指针
func minWindow(s: String, t: String) -> String {
    var charToCount = Dictionary<Character, Int>()
    for ch in t {
        charToCount[ch] = (charToCount[ch] ?? 0) + 1
    }
    var count = charToCount.count
    var start = 0
    var end = 0
    var minStart = 0
    var minEnd = 0
    var minLen = Int.max
    while end < s.count || (count == 0 && end == s.count) {
        if count > 0 {
            let endCh = Character("\(s[s.index(s.startIndex, offsetBy: end)])")
            if let chCount = charToCount[endCh] {
                charToCount[endCh] = chCount - 1
                if chCount - 1 == 0 {
                    count -= 1
                }
            }
            end += 1
        }else {
            if end - start < minLen {
                minLen = end - start
                minStart = start
                minEnd = end
            }
            let startCh = Character("\(s[s.index(s.startIndex, offsetBy: start)])")
            if let chCount = charToCount[startCh] {
                charToCount[startCh] = chCount + 1
                if chCount + 1 == 1 {
                    count += 1
                }
            }
            start += 1
        }
    }
    return minLen == Int.max ? "" : String(s[s.index(s.startIndex, offsetBy: minStart)..<s.index(s.startIndex, offsetBy: minEnd)])
}
