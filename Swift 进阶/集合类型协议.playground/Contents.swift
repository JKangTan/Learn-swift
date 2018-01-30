//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 序列 Sequence 代表一系列具有下同类型的值
// 满足 Sequence 协议的要求十分简单 “需要做的所有事情就是提供一个返回迭代器 (iterator) 的 makeIterator() 方法”
/*
 protocol Sequence {
 associatedtype Iterator: IteratorProtocol
 func makeIterator() -> Iterator
 }
 
 // 迭代器
 protocol IteratorProtocol {
 associatedtype Element
 mutating func next() -> Element?
 }
 */
// 无限返回同一值得迭代器
struct ConstantIterator: IteratorProtocol{
    mutating func next() -> Int?{
        return 1
    }
}
struct FibsIterator: IteratorProtocol {
    var state = (0, 1)
    mutating func next() -> Int? {
        let upcomingNumber = state.0
        state = (state.1,state.0+state.1)
        return upcomingNumber
    }
}

var fib = FibsIterator()
//while let x = fib.next(){
//    print(x)
//}



// 遵守序列协议
struct PrefixIterator: IteratorProtocol{
    let string: String
    var offset: String.Index
    
    init(str: String) {
        self.string = str
        offset  = str.startIndex
    }
    
    mutating func next() -> String? {
        guard offset < string.endIndex else {
            return nil
        }
        offset = string.index(after: offset)
        return String(string[string.startIndex..<offset])
    }
}

struct PrefixSequence: Sequence{
    let string: String
    
    func makeIterator() -> PrefixIterator {
        return PrefixIterator(str: string)
    }
}
for prefix in PrefixSequence(string: "Hello"){
    print(prefix)
}

let seq = stride(from: 0, to: 10, by: 1)
var i1 = seq.makeIterator()
i1.next()
i1.next()

var i2 = i1
i1.next()
i1.next()
i2.next()
i2.next()

// AnyIterator
var i3 = AnyIterator(i1)
var i4 = i3 //引用 迭代器共享

i3.next()
i4.next()


//基于函数的迭代器和序列
func fibsIterator() -> AnyIterator<Int> {
    var state = (0, 1)
    return AnyIterator{
        let upcomingNumber = state.0
        state = (state.1, state.0 + state.1)
        return upcomingNumber
    }
}
let fibsSequence = AnySequence(fibsIterator)
print(Array(fibsSequence.prefix(10)))


let randomNumbers = sequence(first: 100) { (previous: UInt32) in
    let newValue = arc4random_uniform(previous)
    guard newValue > 0 else {
        return nil
    }
    return newValue
}
print(Array(randomNumbers))

//sequence(state:next:) 因为它可以在两次 next 闭包被调用之间保存任意的可变状态”
let fibs2 = sequence(state: (0,1)) {
    // 这里编译器需要一些类型推断的协助
    (state: inout(Int, Int)) -> Int? in
    let upcomingNumbers = state.0
    state = (state.1, state.0 + state.1)
    return upcomingNumbers
}

print(Array(fibs2.prefix(10)))











