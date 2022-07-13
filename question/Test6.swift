//
//  Test6.swift
//  question
//
//  Created by Hanzengchao on 2022/7/10.
//

import Foundation
/*只出现一次的数字
    给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出只出现了一次的元素。
 解题思路
   1,排序后循环对比
   2, 用^=运算符来对比
 **/


func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    for num in nums {
        res ^= num
    }
    return res
}

//if nums.count == 1 {
//    return nums[0]
//}
//var res = nums[0], fast = 0
//// 用来记录是否比对出结果
//var isBreak = true
//let sortNums = nums.sorted()
////只用循环1/2 sortNums.count次
//while fast < sortNums.count - 1 {
//    if sortNums[fast] != sortNums[fast + 1] {
//        res = sortNums[fast]
//        isBreak = false
//        break
//    }
//    fast += 2
//}
//// 如果没有比对出结果，说明将单独的数字排在了最后一位
//if isBreak {
//    res = sortNums[sortNums.count - 1]
//}
//return res
