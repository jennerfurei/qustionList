//
//  TestTwo.swift
//  question
//
//  Created by Hanzengchao on 2022/7/6.
//

import Foundation

/**
 算法第一题 两数之和
 第一种写法*/
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var res = [Int]()
    var dict = [Int : Int]()
    for i in 0 ..< nums.count {
        let other = target - nums[i]
        if dict.keys.contains(other) {
            res.append(i)
            res.append(dict[other]!)
            return res
        }
        // 需要把num[i] 给到dict的value
        dict[i] = nums[i]
    }
    return res
}

/**
 Parameters
 nums 需要计算的数组
 target 需要相等的值
 **/
func twoSumDic(_ nums: [Int], _ target: Int) -> [Int] {
    // 创建一个存返回值的数组res
    var res = [Int]()
    // 创建一个字典来保存坐标
    var dict = [Int : Int]()
    // for 循环来遍历 num数组
    for i in 0 ..< nums.count {
        // 临时变量other来保存 总和值-去nums[i]的值
        let other = target - nums[i]
        //  如果 dict 的key 包含 other
        if dict.keys.contains(other) {
            // res 把dict[other]加入到自身去
            res.append(other)
            // res 把i加入到自身去
            res.append(nums[i])
            //  返回res
            return res
        }
        // 添加数据到字典的key中
        dict[nums[i]] = i
    }
    // 返回空的数组
    return res
}
/**array 实现的写法**/
func twoSumArray(_ nums: [Int], _ target: Int) -> [Int] {
    // 创建一个存返回值的数组res
    var res = [Int]()
    // 创建一个数组来保存遍历过的值
    var arr = [Int]()
    // for 循环来遍历 num数组
    for i in 0 ..< nums.count {
        let other = target - nums[i];
        if arr.contains(other){
            res.append(other)
            res.append(nums[i])
            return res
        }
        arr.append(nums[i])
    }
    // 返回空的数组
    return res
}
/**  两数之和，返回下标，非返回num，enumerated()方法会直接将数组拆成顺序的字典*/
func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    
//    for i in 0 ..< nums.count - 1 {
//        for j in i+1 ..< nums.count {
//            if nums[i] + nums[j] == target{
//                return[i,j]
//            }
//        }
//    }
    
//    var dict = Dictionary<Int, Int>(minimumCapacity: nums.count - 1)
//    dict[0] = nums[0]
//    for i in 1 ..< nums.count {
//        let other = target - nums[i]
//        for j in dict.keys {
//            if dict[j]! == other{
//                return [i,j]
//            }
//        }
//        dict[i] = nums[i]
//
//    }
//    return[Int]()
    var map = [Int: Int]()
    for (i, e) in nums.enumerated() {
        if let v = map[target - e] {
            return [v, i]
        } else {
            map[e] = i
        }
    }
    return []
}

/**
 算法第第二题 二分法查找
 nums 需要查找的数组
 selectNum 需要相等的值
 return index
 */
func twoSelect(_ nums : [Int] , selectNum : Int) -> Int {
    var lowNum = 0 ,highNum = nums.count - 1,index = -1
    while lowNum <= highNum {
        // 获取到中间坐标
        let centerIndex = (lowNum + highNum) / 2
            // 如果值等于[centerIndex]
            if nums[centerIndex] == selectNum {
                index = centerIndex
                break
            }
            // 如果值大于sortNums[centerIndex]
            if selectNum > nums[centerIndex] {
            // 最小坐标右移到中间坐标的下一位
                lowNum = centerIndex + 1
            }
            // 如果值小于sortNums[centerIndex]
            if  selectNum < nums[centerIndex] {
            // 最大坐标左移到中间坐标的下一位
                highNum = centerIndex - 1
            }
        }
    return index
}
