//
//  Test4.swift
//  question
//
//  Created by Hanzengchao on 2022/7/8.
//

import Foundation

/*有序数组删除重复项
 给一个有序的数组nums,删除里面的重复数据，不能开辟额外的空间（不能创建新的数组）返回新数组的长度
 解题思路
        有序数组，如果有重复数据，重复数据必然相邻
        将不重复的数向左移，双指针（坐标）对比，第二个坐标为不重复数组的指针
        获取移除后数组的长度
 **/
func removeDuplicates(_ nums: inout [Int]) -> Int {
    // 空判断
    if nums.count == 0 {
        return 0
    }
    // 定义两个index，从1开始，
    var fast = 1 ; var slow = 1
    while fast < nums.count {
        // 判断当前位置的数据不等于下一位的数据
        if nums[slow - 1] != nums[fast] {
            // 将数据赋值给未重复数据的下一位坐标
            nums[slow] = nums[fast]
            //将未重复数据的坐标+1
            slow += 1
        }
        //原数组的坐标加一
        fast += 1
    }
    //如果需要返回数组，因为下标是从0开始，所以要减去1，移除 slow-1位到右边所有的重复元素
    //nums.removeSubrange(slow - 1 ..< nums.count)
    //返回数组的长度，
    return slow
}


/*存在重复元素
    给一个整数数组，如果任一值在数组中出现至少两次，返回true，如果数组中每个元素互不相同，返回false
 解题思路
    1 排序之后，对比相邻元素
    2 利用set的特性
    3 双重遍历来对比
    4 利用Dictionary的key来对比
    5 新建一个数组，循环追加数据查找
 **/

func contaniDuplicate(_ nums: [Int]) -> Bool {
    //1
    let sortNums = nums.sorted()
    for i in 1 ..< sortNums.count {
        if sortNums[i - 1] == sortNums[i] {
            return true
        }
    }
    //2
    if nums.count > Set(nums).count {
        return true
    }
    //3
    for i in 0 ..< nums.count {
        for j in i+1 ..< nums.count{
            if nums[i] == nums[j] {
                return true
            }
        }
    }
    //4
    var dict = [Int : Int]()
    for num in nums {
        if dict.keys.contains(num) {
            return true
        }
        dict[num] = num
    }
    // 5
    var nums1 = [Int]()
        for num in nums {
            if nums1.contains(num) {
                return true
            }
            nums1.append(num)
        }
    return false
}

