//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
extension Sequence {
    func last(where predicate:(Iterator.Element) -> Bool) -> Iterator.Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}

let list = ["abc", "dec", "ert"]
let newList = list.last{$0.hasSuffix("c")}
print(newList!)

extension Array {
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult:(Result, Element)->Result) -> [Result] {
        var running = initialResult
        return map{ next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}

[1,2,3,4].accumulate(1, +)

// 寻找0-100内偶数切是平方数的集合
let acc = (0..<10).map{$0*$0}.filter{$0 % 2 == 0}
print(acc)

//map filter 都作用在一个数组上 合并产生一个新的数组

var fibs = [0, 1, 1, 2, 3, 5]
print(fibs.reduce(""){str, num in str + " \(num)"})

// forEach 和 for 循环类似
//不同 : 闭包内的 return 并不会结束循环 只是结束闭包
(1..<4).forEach{ item in
    print(item)
    if item > 2 { return }
}

// 切片 slice
let slice = fibs[1..<3]
type(of: slice)




