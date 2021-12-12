/** 题目：排序数组中的两个数字之和
 * 输入一个递增排序的数组和一个值k，请问如何在数组中找出两个和为 k 的数字并返回它们的下标？假设数组中存在且只存在一对符合条件的数字，同时一个数字不能使用两次
 */

import Foundation

//MARK: 方法1：空间换时间的方法，使用字典，时间复杂度 O(n) 空间复杂度 O(n)
//func twoSum(numbers: Array<Int>, target: Int) -> Array<Int> {
//    var map = Dictionary<Int, Int>()
//    for i in 0..<numbers.count {
//        if let index = map[target - numbers[i]] {
//            return [index, i]
//        }
//        map[numbers[i]] = i
//    }
//    return []
//}

//MARK: 方法2：双指针，时间复杂度 O(n) 空间复杂度 O(1)
func twoSum(numbers: Array<Int>, target: Int) -> Array<Int> {
    var i = 0
    var j = numbers.count - 1
    while i < j && numbers[i] + numbers[j] != target {
        if numbers[i] + numbers[j] < target {
            i += 1
        }else {
            j -= 1
        }
    }
    return [i, j]
}
