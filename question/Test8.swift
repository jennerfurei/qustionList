//
//  Test8.swift
//  question
//
//  Created by Hanzengchao on 2022/7/14.
//

import Foundation

/**给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
 
    你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
 
 解题思路
    1，将数据横轴交换，例如1，2，3先交换为7，8，9，再对角交换

    2,  将数据从1 =》 3 ，3 =》9，9 = 》7，7=》9，再依次2，6，8，4

    3，扩展，可以开辟一块新的空间，将数据依次重新赋值（不符合题目，但是可以做到）
*/
func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    // 依次交换第一组和最后一组，横向翻转数据
    for i in 0 ..< n/2 {
        for j in 0 ..< n  {
            let other = matrix[i][j]
            matrix[i][j] =  matrix[n - i - 1][j]
            matrix[n - i - 1][j] = other
         }
     }
     // 依次对角翻转数据
    for i in 0 ..< n {
        for j in 0 ..< i{
            let other = matrix[i][j]
            matrix[i][j] =  matrix[j][i]
            matrix[j][i] = other
         }
     }
    
    //2 只用循环 横轴的一般
    for i in 0 ..< matrix.count/2 {
        // 只用 循环 长度- 横轴旋转的次数 - 1次
        for j in i ..< matrix.count - 1 - i{
            // 需要交 从边角依次交换向 中间位置
            let other = matrix[i][j]
            // i :j => count - 1 - j : i
            matrix[i][j] =  matrix[matrix.count - 1 - j][i]
            // count - 1 - j : i => matrix.count - 1 - i : matrix.count - 1 - j
            matrix[matrix.count - 1 - j][i] = matrix[matrix.count - 1 - i][matrix.count - 1 - j]
            //  count - 1 - i : count - 1 - j => j: matrix.count - 1 - i
            matrix[matrix.count - 1 - i][matrix.count - 1 - j] = matrix[j][matrix.count - 1 - i]
            // j: count - 1 - i => i : j
            matrix[j][matrix.count - 1 - i] = other
        }
    }
    // 3 复制一份数据，在复制的时候重新将数据填充
//    let n = matrix.count
//    var matrix1 = matrix
//    for i in 0 ..< n {
//        for j in 0 ..< n {
//            matrix1[j][n - i - 1] = matrix[i][j]
//        }
//    }
//    matrix = matrix1
}

//                         [["8","3",".",".","7",".",".",".","."]
//                         ,["6",".",".","1","9","5",".",".","."]
//                         ,[".","9","8",".",".",".",".","6","."]
//                         ,["8",".",".",".","6",".",".",".","3"]
//                         ,["4",".",".","8",".","3",".",".","1"]
//                         ,["7",".",".",".","2",".",".",".","6"]
//                         ,[".","6",".",".",".",".","2","8","."]
//                         ,[".",".",".","4","1","9",".",".","5"]
//                         ,[".",".",".",".","8",".",".","7","9"]]

/**数独，将数据分别先装进字典的数组中，然后在有key的情况下依次赋值，如果横，竖，小方格均不存在，将其加入到字典的数组中，如果存在，则说明数据重复**/
func isValidSudoku(_ board: [[Character]]) -> Bool {
    // 创建三个存储 Character:Int 类型字典的数组
    var rowDicArray = [[Character:Int]]()
    var columnsDicArray = [[Character:Int]]()
    var subBoxDicArray =  [[Character:Int]]()
    // 给每个数据添加值为Character为key value为0的数据
    for _ in 0 ..< board.count {
        rowDicArray.append([Character:Int]())
        columnsDicArray.append([Character:Int]())
        subBoxDicArray.append([Character:Int]())
    }
    // 双重循环，获取两个下标
    for i in 0 ..< board.count {
        for j in 0 ..< board[i].count {
            // 获取到数据，和小方格的坐标
            let num = board[i][j], boxIndex = i/3 + (j/3)*3
            if num == "."{
                continue
                // 判断横行=》字典中key 为num 的值是否存在
            }else if rowDicArray[i][num] ?? 0 > 0{
                return false
                // 判断竖行行=》字典中key 为num 的值是否存在
            }else if columnsDicArray[j][num] ?? 0 > 0{
                return false
                // 判断小方格=》字典中key 为num 的值是否存在
            }else if subBoxDicArray[boxIndex][num] ?? 0 > 0{
                return false
            }else{
                // 如果不存在将key为num 的值 = 1
                rowDicArray[i][num] = 1
                columnsDicArray[j][num] = 1
                subBoxDicArray[boxIndex][num] = 1
            }
        }
    }
    return true
}
