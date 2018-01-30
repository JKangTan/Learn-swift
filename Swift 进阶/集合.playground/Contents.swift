//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 为队列设计协议

///一个能够将元素入队和出队的类型
protocol Queue {
    /// 在 self 中所持有的元素类型
    associatedtype Element
    /// 将 newElement 入队到 self
    mutating func enqueue(_ newElement: Element)
    /// 将 self 出队一个元素
    mutating func dequeue() -> Element?
}

///一个高效的 FIFO 队列 元素类型为 Element
struct FIFOQueue<Element>: Queue {
    fileprivate var left:[Element] = []
    fileprivate var right:[Element] = []
    
    ///将元素添加到队列最后
    /// 复杂度 O(1)
    mutating func enqueue(_ newElement: Element) {
        right.append(newElement)
    }
    /// 从队列前端移除一个元素
    /// 当队列为空时 返回 nil
    /// 复杂度: 平摊 O(1)
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

/// 遵循 collection 协议 实现下列方法
extension FIFOQueue: Collection{
    ///起始位置
    public var startIndex: Int {return 0}
    ///长度
    public var endIndex: Int {return left.count + right.count}
    /// 步进查询
    public func index(after i: Int) -> Int {
        precondition(i < endIndex)
        return i + 1
    }
    /// 提供下标查询
    public subscript (position: Int) -> Element{
        precondition((0..<endIndex).contains(position),"index out of bounds")
        if position < left.endIndex{
            return left[left.count-position-1]
        }else {
            return right[position - left.count]
        }
    }
}

var q = FIFOQueue<String>()
for x in ["1","2","foo","3"]{
    q.enqueue(x)
}

for x in q {
    print(x, separator: " ", terminator: " ")
}

print("\n\(q)")
var a =  Array(q)
a.append(contentsOf:q[2...3])
//我们可以调用 Sequence 的扩展方法和属性
q.map{$0.uppercased()}
q.flatMap{Int($0)}
//也可以调用 Collection 的扩展方法和属性
q.isEmpty
q.count
q.first

///遵守 ExpressibleByArrayLiteral 协议
extension FIFOQueue: ExpressibleByArrayLiteral
{
    public init(arrayLiteral elements: Element...) {
        self.init(left: elements.reversed(), right: [])
    }
}
///“现在我们就可以用数组字面量来创建一个队列了”
let queue: FIFOQueue = [1,2,3]
print(queue)





























