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

var array1 = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]

var array2 = [8,6,5,8,1]
var array3 = [8,6,5,4,8,1]


let res = rotate(&array1)
print("______")
print(res)

/**归并排序，利用递归的思想来做排序**/




func mergeSort(arr:inout [Int]) {
        guard arr.count > 0 else {
            return
        }
        process(arr: &arr, left: 0, right: arr.count - 1)
    }
    //该方法主要用作二分
    func process(arr:inout [Int],left:Int,right:Int) {
        if left == right {
            return
        }
        /** << 和 >> 是  位移运算符
         箭头是指向的方向
         先把数据换算成2进制
         << = 向左移n位 然后右边末尾补充一个n个0,十进制数据相当于*2
         >> = 向右移动n位，左边最前面补n个0作为数据补齐  因为存在奇数，所以相当于/2 计算机会抹去余数，5/2 = 2 会这样计算
         left + (right - left) >> 1 = (right - left)
         */
        let middle = left + (right - left) >> 1
        process(arr: &arr, left: left, right: middle)
        process(arr: &arr, left: middle + 1, right: right)
        merge(arr: &arr, left: left, middle: middle, right: right)
        
        
    }
    //将二分后的数组进行合并
    func merge(arr:inout [Int],left:Int,middle:Int,right:Int){
        var help:[Int] = [Int]()
        
        var leftLocation:Int = left
        var rightLocation:Int = middle + 1
        
        while (leftLocation <= middle && rightLocation <= right) {
            if arr[leftLocation] <= arr[rightLocation] {
                help.append(arr[leftLocation])
                leftLocation += 1
            }else{
                help.append(arr[rightLocation])
                rightLocation += 1
            }
        }
        
        while leftLocation <= middle {
            help.append(arr[leftLocation])
            leftLocation += 1
            
        }
        while rightLocation <= right {
            help.append(arr[rightLocation])
            rightLocation += 1
        }
        var index = left
        for item in help {
            arr[index] = item
            index += 1
        }
        print(arr)
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


