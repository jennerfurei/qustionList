//
//  Test7.swift
//  question
//
//  Created by Hanzengchao on 2022/7/11.
//

import Foundation
/**
 两个数组的交集 II
    给你两个整数数组 nums1 和 nums2 ，请你以数组形式返回两数组的交集。返回结果中每个元素出现的次数，应与元素在两个数组中都出现的次数一致（如果出现次数不一致，则考虑取较小值）。可以不考虑输出结果的顺序。
 解题思路
    1，哈希表形式，把较短数组的值当作key，重复一次，value+1一次，再循环较长的数组，出现key和值相等的时候，将value值-1，将key加入数组
    2，两个数组排序之后，二分法来比对
 
 */

func intersect1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    // 判断数据的长短
    var otherNums1 = nums1.sorted(), otherNums2 = nums2.sorted() ,res = [Int]()
    if nums2.count > nums1.count {
        let nums = otherNums1
        otherNums1 = otherNums2
        otherNums2 = nums
    }
    var tabValue = 0
    // 二分法来对比 数据
    for otherNum1 in otherNums1 {
        let other = otherNum1
        var fast = tabValue, slow = otherNums2.count - 1
        while fast <= slow {
            let centerIndex = (fast + slow)/2
            if otherNums2[centerIndex] == other {
                // 如果数据相等，这时候可能前一位也是相等的，所以不能直接返回
                slow = centerIndex - 1
            }else if otherNums2[centerIndex] > other {
                slow = centerIndex - 1
            }else{
                fast = centerIndex + 1
            }
        }
        if fast < otherNums2.count && otherNums2[fast] == other {
            res.append(other)
            tabValue = fast + 1
        }
    }

    return res
}
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    // 判断数据的长短，用短的来做字典的key
    var otherNums1 = nums1, otherNums2 = nums2
    if nums2.count > nums1.count {
        let nums = otherNums1
        otherNums1 = otherNums2
        otherNums2 = nums
    }
    //循环将数据装在类似哈希表的字典里
    var dict = [Int:Int]()
    for num in otherNums1 {
        if dict[num] == nil {
            dict[num] = 0
        }
        dict[num]! += 1
    }
    // 循环的时候将哈希表的数据和当前数据对比，如果存在将数据追加并且将哈希表中同key的值减1
    var res = [Int]()
    for num in otherNums2 {
        if dict.keys.contains(num) && dict[num]! > 0 {
            dict[num]! -= 1
            res.append(num)
            if dict[num]! == 0 {
                dict[num] = nil
            }
        }
    }
    return res
}

/**
 加一
    给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。

    最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

    你可以假设除了整数 0 之外，这个整数不会以零开头。
    [9,9]
    [1,0,0]
    解题思路
    倒序循环，在最末位的数字去加1
    如果加1后大于10，就将数据置于0，如果小于10 直接跳出循环
    最后判断是否循环到数组的第一位，如果循环到第一位也大于10 ，将其置于1 ，给数组末尾追加一位0
 */
func plusOne(_ digits: [Int]) -> [Int] {
    var other = digits
    var otherCount = digits.count - 1
    while otherCount >= 0{
        // 判断当前位是否等于9 不等于的话给当前位数据 +1 后直接跳出循环
        if other[otherCount] != 9 {
            other[otherCount] += 1
            break
        }else{
            other[otherCount] = 0
            otherCount -= 1
        }
    }
    // 判断是否循环到数组的第一位
    if otherCount == -1 {
        other.append(0)
        other[0] = 1
    }
     return other
}
