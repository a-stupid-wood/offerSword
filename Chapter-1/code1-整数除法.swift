/** 题目：整数除法
 * 输入 2 个 Int 型整数，它们进行除法计算并返回商，要求不得使用乘号“*”、除号“/”，及求余符号“%”。当发生溢出时，返回最大的整数值。假设除数不为0。
 */

import Foundation

func divide(dividend: Int, divisor: Int) -> Int {
    if dividend == Int.min, divisor == -1 {
        return Int.max
    }
    
    var new_dividend = dividend
    var new_divisor = divisor
    
    var negative = 2
    if new_dividend > 0 {
        negative -= 1
        new_dividend = -new_dividend
    }
    
    if new_divisor > 0 {
        negative -= 1
        new_divisor = -new_divisor
    }
    let result = divideCore(dividend: new_dividend, divisor: new_divisor)
    return result * (negative  == 1 ? -1 : 1)
}

func divideCore(dividend: Int, divisor: Int) -> Int {
    var result = 0
    var new_dividend = dividend
    let minValue = Int.min >> 1
    while new_dividend <= divisor {
        var value = divisor
        var quotient = 1
        while value >= minValue && new_dividend <= value + value {
            quotient += quotient
            value += value
        }
        result += quotient
        new_dividend -= value
    }
    return result
}

