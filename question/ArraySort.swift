//
//  ArraySort.swift
//  question
//
//  Created by Hanzengchao on 2022/7/14.
//

import Foundation


/**冒泡排序  时间复杂度O(n*n) 空间复杂度O(1)->没有开辟新的内存空间  */
func bubbleSort(_ nums : inout [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }
    //至少要遍历n-1次，所以时间复杂度是O(n)
    for i in 0 ..< nums.count {
        var flag = false
        //最好的情况是一次都不交换,最坏的情况是需要每次都交换，因为是内循环所以是O(n*n)
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
        // 最好的情况是一次都不插入,最坏的情况是插入n次 因为是内循环所以是O(n*n)
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
/**选择排序  时间复杂度O(n*n) 空间复杂度O(1)->没有开辟新的内存空间**/
func chooseSort(_ nums : inout [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }
    //至少要遍历次n次，所以时间复杂度是O(n)
    for i in 0 ..< nums.count {
        var value = nums[i]
        // 无论最好还是最坏情况，都是需要在除开第i位的数据后寻找最小的数据，将其位置交换所以这里也是O(n)
        // 所以时间复杂度是O(n) * 外循环的O(n) = O(n*n)
        for j in i+1 ..< nums.count {
            if nums[j] < value {
                let tmp = value
                value = nums[j]
                nums[j] = tmp
            }
        }
        nums[i] = value
    }
    return nums
}
