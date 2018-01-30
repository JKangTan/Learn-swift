//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 利用上线问推断参数和返回值类型
 单表达式闭包可以省略 return 关键字
 参数名称缩写
 尾随闭包语法
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// 1.0 版本闭包
func backward(_ s1: String, _ s2: String) -> Bool{
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// 2.0版本闭包

reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})
print(reversedNames)

// 3.0 单表达式隐式返回

reversedNames = names.sorted(by: {s1, s2 in s1 > s2})
print(reversedNames)

// 4.0 参数名称缩写
reversedNames = names.sorted(by: {$0 > $1})

// 5.0 运算符方法
reversedNames = names.sorted(by: > )



/*
  尾随闭包 如果闭包表达式是函数的唯一参数 ,当使用尾随闭包时,可以省略()
 */
reversedNames = names.sorted {$0 > $1}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map{
    (number) -> String in
    var number = number //闭包和函数的参数总是常量  不可修改
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output //  ! 表明字典查找不会失败 可以强制解包
        number /= 10
    } while number > 0
    return output
}
print(strings)


/*
    值捕获 闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，
    闭包仍然可以在闭包函数体内引用和修改这些值。
 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int{
    var runingTotal = 0
    func incrementer() -> Int{
        runingTotal += amount
        return runingTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

// 虽然上面 incrementByTen 是常量, 但是常量指向的闭包仍然可以增加其捕获变量的值
// 因为函数和闭包都是引用类型

// 逃逸闭包 闭包追加在数组内 因此函数返回后闭包仍可以被调用 关键词 @escaping 使闭包逃逸出函数的作用域
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出 "200"
completionHandlers.first?()
print(instance.x)
// 打印出 "100"


// 自动闭包

var customerInLine = names
let customerProvider = { customerInLine.remove(at: 0) }
print(customerInLine)

customerProvider()
print(customerInLine)

func serve(customer customerProvider: () -> String){
    print("Now serving \(customerProvider())")
}

serve(customer: {customerInLine.remove(at: 0) })
print(customerInLine)


// @autoclosure 用来指定一个自动闭包 addServe(customer: <#T##String#>) 调用时参数为 string
func addServe(customer customerProvider: @autoclosure () -> String){
    print("Now serving \(customerProvider())")
}

addServe(customer: customerInLine.remove(at: 0))
print(customerInLine)

















