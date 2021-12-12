/** 题目：二维子矩阵的数字之和
 * 输入一个二维矩阵，如何计算给定左上角坐标和右下角坐标的子矩阵的数字之和？
 */
import Foundation

class NumMatrix {
    private var sums: Array<Array<Int>>
    
    init(matrix: Array<Array<Int>>) {
        guard let firstRow = matrix.first, firstRow.count > 0 else {
            sums = Array<Array<Int>>()
            return
        }
        sums = Array(repeating: Array(repeating: 0, count: firstRow.count + 1), count: matrix.count + 1)
        for i in 0..<matrix.count {
            var rowSum = 0
            for j in 0..<firstRow.count {
                rowSum += matrix[i][j]
                sums[i + 1][j + 1] = sums[i][j + 1] + rowSum
            }
        }
    }
    
    func sumRegion(row1: Int, col1: Int, row2: Int, col2: Int) -> Int {
        return sums[row2 + 1][col2 + 1] - sums[row1][col2 + 1] - sums[row2 + 1][col1] + sums[row1][col1]
    }
}
