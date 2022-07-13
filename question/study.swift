//
//  study.swift
//  question
//
//  Created by Hanzengchao on 2022/7/12.
//

import Foundation

/**定义一个链表类 */
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
var listNodeHead = ListNode.init(1, ListNode.init(2, ListNode.init(3, ListNode.init(4, ListNode.init(5,ListNode.init(6))))))

/**链表的中间结点

给定一个头结点为 head 的非空单链表，返回链表的中间结点。

如果有两个中间结点，则返回第二个中间结点。
 
 快慢指针法
 */

    func middleNode(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
             return head
         }
        // 快指针
         var fast = head
        // 慢指针
         var slow = head
        //快慢指针分别指向第一位和第二位
         while fast?.next != nil {
             // 快指针一次跳两位
             fast = fast?.next?.next
             // 慢指针一次跳一位
             slow = slow?.next
         }
             
         return slow
 }


/**Fizz Buzz
 给你一个整数 n ，找出从 1 到 n 各个整数的 Fizz Buzz 表示，并用字符串数组 answer（下标从 1 开始）返回结果，其中：

 answer[i] == "FizzBuzz" 如果 i 同时是 3 和 5 的倍数。
 answer[i] == "Fizz" 如果 i 是 3 的倍数。
 answer[i] == "Buzz" 如果 i 是 5 的倍数。
 answer[i] == i （以字符串形式）如果上述条件全不满足。

 */

func fizzBuzz(_ n: Int) -> [String] {
    var fizzBuzz = [String]()
    for i in 1 ..< n + 1 {
        if i % 3 == 0 &&  i % 5 == 0 {
            fizzBuzz.append("FizzBuzz")
        }else if i % 3 == 0{
            fizzBuzz.append("Fizz")
        }else if i % 5 == 0{
            fizzBuzz.append("Buzz")
        }else{
            fizzBuzz.append(String(i))
        }
    }
    return fizzBuzz
}


/**383. 赎金信
给你两个字符串：ransomNote 和 magazine ，判断 ransomNote 能不能由 magazine 里面的字符构成。

如果可以，返回 true ；否则返回 false 。

magazine 中的每个字符只能在 ransomNote 中使用一次。

func ransomNoteBymagazine(_ string:String ,Closures:(Int, Int) -> Int) {

}
 */

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    if magazine.count < ransomNote.count {
        return false
    }
    
    var record = Array(repeating: 0, count: 26)
    let aUnicodeScalarValue = "a".unicodeScalars.first!.value
    for UnicodeScalarValue in magazine.unicodeScalars {
        let indexValue = Int(UnicodeScalarValue.value - aUnicodeScalarValue)
        record[indexValue] += 1
    }
    for UnicodeScalarValue in ransomNote.unicodeScalars {
        let indexValue = Int(UnicodeScalarValue.value - aUnicodeScalarValue)
        record[indexValue] -= 1
        if record[indexValue] < 0 {
            return false
        }
    }
    return true
}




/*动态和
 
 给你一个数组 nums 。数组「动态和」的计算公式为：runningSum[i] = sum(nums[0]…nums[i]) 。

 请返回 nums 的动态和。
 
 解题思路
 
 循环从第二位开始将数据和前一位相加
 map函数的使用

 **/
func runningSum(_ nums: [Int]) -> [Int] {
    
//    var other = nums
//    for i in 1 ..< other.count {
//      other[i] += other[i - 1]
//    }
//    return other
    
    var calculateNum = nums
    var other = 0
    calculateNum = calculateNum.map {
        other += $0
        return other
    }
    return calculateNum
}


/**1672. 最富有客户的资产总量
给你一个 m x n 的整数网格 accounts ，其中 accounts[i][j] 是第 i​​​​​​​​​​​​ 位客户在第 j 家银行托管的资产数量。返回最富有客户所拥有的 资产总量 。

客户的 资产总量 就是他们在各家银行托管的资产数量之和。最富有客户就是 资产总量 最大的客户。
 */

func maximumWealth(_ accounts: [[Int]]) -> Int {
    var res = 0
    for itemAccount in accounts {
        var item = 0
        for ac in itemAccount {
            item += ac
        }
        if res < item {
            res = item
        }
    }
    return res
}





/**1342. 将数字变成 0 的操作次数
 给你一个非负整数 num ，请你返回将它变成 0 所需要的步数。 如果当前数字是偶数，你需要把它除以 2 ；否则，减去 1 。*/


func numberOfSteps(_ num: Int) -> Int {
//    var res = 0, otherNum = num
//
//    while otherNum > 0 {
//        // 三元表达式，相当于
////        if otherNum % 2 == 0 {
////            otherNum / 2
////        }else{
////            otherNum - 1
////        }
//        otherNum = otherNum % 2 == 0 ? otherNum/2 :otherNum - 1
//        res += 1
//    }
//    return res
//    return res
    
//    guard 用法 如果 num <= 0 则执行else的代码，否则执行下一步
    guard num > 0 else {
        return 0
    }
    // 在guard return之后 return numberOfSteps(num % 2 == 0 ? num / 2 : num - 1) + 1运行了四次，这是问题。需要探索
    print(num)
    return numberOfSteps(num % 2 == 0 ? num / 2 : num - 1) + 1
}
