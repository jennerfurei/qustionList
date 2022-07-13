//
//  main.swift
//  question
//
//  Created by Hanzengchao on 2022/6/28.
//

import Foundation
import AppKit




//        self.navigationController?.navigationBar.isTranslucent = true;
//        //设置导航栏背景透明
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(),
//                                                                    for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()






var array = [-336,513,-560,-481,-174,101,-997,40,-527,-784,-283,-336,513,-560,-481,-174,101,-997,40,-527,-784,-283,354]

var array1 = [[1,2,3],[4,5,6],[7,8,9]]

var array2 = [8,6,5,8,1]
var array3 = [8,6,5,4,8,1]


let res = chooseSort(&array2)

print(res)


/** 冒泡  时间复杂度O(n*n) 空间复杂度O(1)->没有开辟新的内存空间  */
func bubbleSort(_ nums : inout [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }
    for i in 0 ..< nums.count {
        var flag = false
        for j in 0 ..< nums.count - i - 1 {
            if nums[j] > nums[j+1] {
                let tmp = nums[j]
                nums[j] = nums[j+1]
                nums[j+1] = tmp
                flag = true
            }
        }
        if !flag {
            break
        }
    }
    return nums
}
/**插入排序  时间复杂度O(n*n) 空间复杂度O(1)->没有开辟新的内存空间**/
func insertSort(_ nums : inout [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }
    //至少要遍历n-1次，所以时间复杂度是O(n)
    for i in 1 ..< nums.count {
        let value = nums[i]
        var j = i - 1
        // 最好的情况是一次都不插入，所以是O(n),最坏的情况是插入n次 因为是内循环所以是O(n*n)
        while j >= 0 {
            if nums[j] > value {
                nums[j+1] = nums[j]
            }else{
                break
            }
            // [8,6,5,8,1]
            j -= 1
        }
        nums[j + 1] = value
    }
    return nums
}
///**选择排序  时间复杂度O(n*n) 空间复杂度O(1)->没有开辟新的内存空间**/
//func chooseSort(_ nums : inout [Int]) -> [Int] {
//    if nums.count <= 1 {
//        return nums
//    }
//    //至少要遍历次n次，所以时间复杂度是O(n)
//    var value = 0
//    for i in 0 ..< nums.count {
//      
//        if value < nums[i] {
//            value = nums[i]
//        }
//        let j = i + 1
//        for j in 1 ..< nums.count - 1 {
//            if nums[j] > value {
//                nums[nums.count - 1] = value
//            }else{
//                break
//            }
//        }
//        nums[nums.count - j] = value
//        
//    }
//    return nums
//}






/**给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
 
    你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
*/
func rotate(_ matrix: inout [[Int]]) {
    
//    let n = matrix.count
//    var matrix1 = matrix
//    for i in 0 ..< n {
//        for j in 0 ..< n {
//            matrix1[j][n - i - 1] = matrix[i][j]
//        }
//    }
//    matrix = matrix1
    
    
//    let n = matrix.count
//    for i in 0 ..< n/2 {
//        for j in 0 ..< n - 1  {
//            matrix.swapAt(matrix[i][j], matrix[n - i - 1][j])
//         }
//     }
//     // 主对角线翻转
//    for i in 0 ..< n {
//        for j in 0 ..< i{
//            matrix.swapAt(matrix[i][j], matrix[j][i]);
//         }
//     }
    
    
    
//    // 只用循环 横轴的一般
    for i in 0 ..< matrix.count/2 {
        // 只用 循环 长度- 横轴旋转的次数 - 1次
        for j in i ..< matrix.count - 1 - i{
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
    print(matrix)
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
/**
 移动零
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 请注意 ，必须在不复制数组的情况下原地对数组进行操作。
 
 解题思路：1 双指针交换法，判断当前位是否为0 ，如果为0 就将数据和下一位交换
         2 单指针移动非0的数据，将非0 的数据移动到左侧，然后补齐0的个数
 */
func moveZeroes(_ nums: inout [Int]) {
//    var numsCount = nums.count, leftIndex = 0, rightIndex = 0
//    while rightIndex < numsCount  {
//        if nums[rightIndex] != 0 {
//            nums.swapAt(leftIndex, rightIndex)
//            leftIndex += 1
//        }
//        rightIndex += 1
//    }
    
    var zerosFristIndex = 0
    for i in 0 ..< nums.count {
        if nums[i] != 0 {
            nums[zerosFristIndex] = nums[i]
            zerosFristIndex += 1
        }
    }
    while zerosFristIndex < nums.count{
        nums[zerosFristIndex] = 0
        zerosFristIndex += 1
    }
}

func forList() {
    let list = [1,2,3,4];
    /**反向遍历**/
    for idx in list.reversed() {
        print("idx =\(idx)");
    }
    //print(res);
    /**带坐标遍历**/
    for (idx,item) in list.enumerated() {
           print("下标：\(idx) 值：\(item)")
    }
    /** 跨步遍历 从0 到10 没隔两个遍历一次
     pram *from 从第i位开始
     pram *to 到第i位 结束
     pram *by 每一次遍历间隔多少
     */
    for idx in stride(from: 0, to: 10, by: 2) {
           print("idx = \(idx)");
           
    }
    /** 遍历区间0到3 =>0，1，2 前面是闭区间，后面是开区间 */
    for idx in 0...3 {
          print("idx =\(idx)");
    }
    /** 可以直接遍历数组*/
    let dict = ["a":1,"b":2,"c":3];
    for (key,value) in dict {
        print("key: \(key) value : \(value) ");
        
    }
}


