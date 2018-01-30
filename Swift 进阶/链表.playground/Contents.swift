//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/// 一个简单的链表枚举
enum List<Element> {
    case end
    indirect case node(Element, next: List<Element>)
}

extension List {
    /// 在链表前方添加一个值为 x 的节点 并返回这个链表
    func cons(_ x:Element) -> List {
        return .node(x, next: self)
    }
}
// 一个拥有三个元素的链表 (3,2,1)
let list = List<Int>.end.cons(1).cons(2).cons(3)
//添加数组字面量的初始化方式
extension List: ExpressibleByArrayLiteral{
    init(arrayLiteral elements: Element...) {
        //reduce($0) 初始化值 接闭包
        self = elements.reversed().reduce(.end){ partialList, element in
            partialList.cons(element)
        }
    }
}
let list2: List = [3,2,1]

// 栈
/// 栈操作是 后进先出 LIFO
protocol Stack {
    /// 栈中储存的元素类型
    associatedtype Element
    /// 将 x 入栈到 self 作为栈顶元素
    /// 复杂度 O(1)
    mutating func push(_ x: Element)
    
    ///从 self 移除栈顶元素 并并返回它
    ///如果 self 是空 返回 nil
    /// 复杂度 O(1)
    mutating func pop() -> Element?
}

extension List: Stack{
    mutating func push(_ x: Element) {
        self = self.cons(x)
    }
    
    mutating func pop() -> Element? {
        switch self {
        case .end:
            return nil
        case let .node(x, next: xs):
            self = xs
            return x
        }
    }
}

var stack: List<Int> = [3,2,1]
var a = stack
var b = stack

a.pop()
a.pop()
a.pop()

stack.pop()

stack.push(4)

b.pop()
b.pop()
b.pop()
b.pop()
// 这说明 值和变量之间的不同 列表的节点是值 他们不会发生改变 只是当前指向的节点发生了变化

// 使 List 遵循 Sequence 
extension List: IteratorProtocol, Sequence{
    mutating func next() -> Element? {
        return pop()
    }
}
// List 可以使用标准库中的函数














