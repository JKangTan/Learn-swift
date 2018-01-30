//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 使用 open public internal filepart private 来声明实体的访问级别
// 元组的访问级别由组内访问级别最低的元素决定
// 函数的访问级别根据最严格的参数类型或返回类型的访问级别来决定

struct TrackedString {
    private(set) var numOfEdits = 0
    var value: String = ""{
        didSet{
            numOfEdits += 1
        }
    }
}
var stringEdit = TrackedString()
stringEdit.value = "go go go"
stringEdit.value += "ha ha ha"
stringEdit.value += "wang wang wang"
print(stringEdit.numOfEdits)

// 取反 ~
// 按位与运算 &
// 或运算 |

































