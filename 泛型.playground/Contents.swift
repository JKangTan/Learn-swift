//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//泛型函数
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temp = a
    a = b
    b = temp
}

var a = 3
var b = 7
swapTwoValues(&a, &b)
print(a,b)

//泛型类型

struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack<String>()
stackOfString.push(item: "uuu")
stackOfString.push(item: "iii")
stackOfString.push(item: "ppp")

print(stackOfString.items)
stackOfString.pop()
print(stackOfString.items)

//扩展一个泛型类型 不需要重新定义参数类型列表 可以直接使用原始类型
extension Stack{
    var topItem: Element? {
        return items.isEmpty ? nil: items[items.count-1]
    }
}
print(stackOfString.topItem!)

// 类型约束
func findIndex(ofString valueToFind: String, in array:[String]) -> Int? {
    for (index, value) in array.enumerated(){
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "dog", in: strings) {
    print("the index of dog is \(foundIndex)")
}

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(array: [3.14159, 0.1, 0.25], 9.3)


//关联类型  associatedtype 关键字指定关联类型
protocol Container{
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // Container 协议部分
    typealias ItemType = Int //可以省略  由 swift 类型推断
    mutating func append(item: Int) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript (i: Int) -> Int {
        return items[i]
    }
}


struct StackElement<Element>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
    mutating func append(item: Element) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript (i: Int) -> Element {
        return items[i]
    }
}

//通过扩展一个存在的类型来指定关联类型
// Array类型遵循了 Container 协议 因此你可以通过实现一个空扩展
//extension Array: Container {}

// 泛型 Where 语句
func allItemMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    //检查每一对元素是否相同
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

var stackOfStr = StackElement<Int>()
stackOfStr.push(item: 123)
stackOfStr.push(item: 234)
stackOfStr.push(item: 345)

var stackOfInt = IntStack()
stackOfInt.push(item: 123)
stackOfInt.push(item: 234)
stackOfInt.push(item: 345)

print("the result of compare is \(allItemMatch(stackOfStr, stackOfInt))")


























