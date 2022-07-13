//
//  testOne.swift
//  question
//
//  Created by Hanzengchao on 2022/7/7.
//

import Foundation

enum HMax {
    case HMax1
    func enumFunc(num : Int) -> Int {
        return num
    }
    case HMax2(String)
    
    case HMax3(Int,[Int],HPerson)
    
    case HMax4(Int)
}

let hmax2 = HMax.HMax2("aaa")
let hmax3 = HMax.HMax3(10, [1,2], HPerson.init())

let hmaxFun = HMax.enumFunc(HMax.HMax4(5))
//hmaxFun(10)

class HPerson: Identifiable {
     var name:String
    init(_name : String) {
        name = _name
    }
    init(){
        name = "aaa"
    }
}

struct MPerson {
    var name:String
}

//var res = twoSumDic([1,3,4,6,7,8], 10)
//
//var res1 = twoSumArray([1,3,4,6,7,8], 10)
//
//var res2 = twoSum([1,3,4,6,7,8], 10)
//
//print(res,res1,res2)

//let res = twoSelect([1,3,4,15,6,7,8,10,39,33], selectNum: 7)
//
//print(res)
var classPerson = HPerson.init(_name: "H_Max")
var classPerson1 = HPerson.init()
var structPerson = MPerson.init(name: "H_Max")

//structPerson.name = "abc"
////classPerson1.name = "cba"
//
//
//
//print(classPerson,structPerson)


/**柯里化
 这个函数接受多个参数，返回一个方法
 **/
func multipleTwoNumber(_ num1 : Int) -> (Int) ->Int {
    
    return{$0 + num1}
}

let num1 = multipleTwoNumber(10)

let num2 = num1(10)



//public class HNode<T> {
//    public var node: T
//    var nextNode: HNode?
//    init(_node:T,_nextNode:HNode?) {
//        node = _node
//        nextNode = _nextNode
//    }
//}
//extension HNode:CustomStringConvertible{
//    public var description: String {
//        guard let nextNode = nextNode else {
//            return "\(node)"
//        }
//        return "\(node)->" + String(describing: nextNode)
//    }
//}
//public struct listNode<T>{
//    
//    public var head: HNode<T>?
//    public var size: NSInteger = 0
//
//    public init() {
//        
//    }
//    public var isEmpty:Bool{
//        return head == nil
//    }
//}
//extension listNode:CustomStringConvertible{
//    public var description: String{
//        guard let head = head else{
//            return "empty list"
//        }
//        return String(describing: head)
//    }
//}
//extension listNode{
//    mutating func pushNode(node : T){
//        let node = HNode(_node: node, _nextNode: head!)
//        node.nextNode = head
//        head = node
//        size = size + 1
//    }
//    mutating func appendNode(node : T){
//        let node = HNode(_node: node, _nextNode: nil)
//        let tail = getNode(at: size - 1)
//        if tail == nil {
//            head = node
//        }else{
//            tail!.nextNode = node
//        }
//        size += 1
//    }
//    
//    func getNode(at : NSInteger) -> HNode<T>? {
//        if isEmpty || head == nil || size == 0 || at < 0 || !(at < size){
//            return nil
//        }
//        var location:NSInteger = 0
//        var nextNode = head
//        while nextNode != nil{
//            if at == location {
//                return nextNode!
//            }
//            nextNode = nextNode!.nextNode
//            location += 1
//        }
//        return nil
//    }
//    mutating  func removeNode(at : NSInteger) -> Bool {
//        if isEmpty || head == nil || size == 0 || at < 0 || !(at < size){
//            return false
//        }
//        if at == 0 {
//            let mid = head?.nextNode
//            head = mid
//            size -= 1
//            return true
//        }
//        var location: NSInteger = 1
//        var middleNode: HNode<T> = head!
//        while middleNode.nextNode != nil {
//            if at == location {
//                let mid = middleNode.nextNode!.nextNode
//                middleNode.nextNode = mid
//                size -= 1
//            }
//            middleNode = middleNode.nextNode!
//            location += 1
//        }
//        return false
//    }
//}
