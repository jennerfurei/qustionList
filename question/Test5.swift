//
//  Test5.swift
//  question
//
//  Created by Hanzengchao on 2022/7/9.
//

import Foundation

/*股票买卖最佳时机
    给一个整数数组prices，其中prices[i]标识某支股票第i天的价格，每一天都可以买卖股票，最多只能持有一个股票，返回能获得的最大利润
 解题思路
        1首先买第一次的时候需要依次判断第二天是否上涨，上涨则买入
        2买入之后，向后推两天的判断价格是否下跌，下跌卖出当前卖出，涨价不变，如果卖出，记录当前和最低的价格的差值
        3卖出之后再寻找后面最低的价格，重复步骤2
        循环去判断当前位和下一位的差值是否是正值，如果是正值加入到返回值
 **/
/**贪心算法**/
func bestPeriod(_ nums : [Int]) -> Int {
    var res = 0
    // 遍历第一趟
    for i in 1 ..< nums.count{
        // 判断当前的价格和前一天的的差值是否为正数
        if nums[i] > nums[i - 1] {
            // 将差值保存
            res += (nums[i] - nums[i - 1])
        }
    }

    return res
}



/*旋转数组
    给一个数组，将数组中的元素向右轮转k个位置，k是非负数（尝试不开辟额外的空间来做到）
 解题思路
   1 双重循环，临时定义一个变量依次交换数据
 **/

func rotateTheArray(_ nums : inout [Int], k : Int ) -> [Int] {
    //k有可能比nums的count要大，所以取余
    let remainderK = k % nums.count
    if nums.count <= 1 || remainderK == 0 {
        return nums
    }
    var fast = 0, temp = 0, end = 0
    // 只跑remainderK趟
    while fast < remainderK{
        // 获取到数组的最后一位
        end = nums[nums.count - 1]
        //循环给每一个数据交换
        for i in 0 ..< nums.count {
            //将第i位数据存放在临时变量中
            temp = nums[i]
            // 把end的数据放进第i位
            nums[i] = end
            //end获取到临时变量
            end = temp
        }
        fast += 1
    }
    return nums
}
