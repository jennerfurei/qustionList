//
//  Test3.swift
//  question
//
//  Created by Hanzengchao on 2022/7/8.
//

import Foundation

/*回文数
 给定一个整数num，如果num是一个回文数，返回true，否则返回false，回文数：例如，1221，23432
 解题思路
        首先负数和个位数为0的数都不是回文数，
        对折num让其拆分成两个数
        对于num来说求余10会获得个位数的值，
        获得十位数的值，先将num/10，十位数就变成个位数
        循环得到一半的数字，得到一个翻转的整个后半部分num，
        再对比两个数字
 **/
func palindromicNumber(_ num : inout Int) -> Bool{
    // 判断num小于0 或者 num求余10等于0并且num 不能为0
    if num < 0 || (num % 10 == 0 && num != 0){
        return false
    }else{
        // 定义一个翻转后的 revertedNum
        var revertedNum = 0;
        // 如果num > 翻转后的revertedNum,循环给revertedNum获得翻转
        while (num > revertedNum){
            // revertedNum * 10 后会将个位数清零，加上num求余获得的个位数，就获取到翻转的revertedNum
            revertedNum = revertedNum * 10 + num % 10
            // 操作num，让其/10 ，消除个位数
            num /= 10
        }
        // 如果数字的个数是偶数，则num = revertedNum，如果是奇数位，因为循环是num > revertedNum,所以revertedNum 大于num 在这里将 revertedNum的个位消除
        return num == revertedNum || num == revertedNum / 10
    }

}
