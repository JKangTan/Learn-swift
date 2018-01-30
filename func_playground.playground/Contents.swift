//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(person: String) -> String{
    return "Hello, \(person) !"
}

greet(person: "Jack")

func minMax(array: [Int]) -> (min: Int, max: Int)?{
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = currentMin
    for value in array[1...array.count-1]{
        if value < currentMin {
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 11, 66])!
print(bounds.0, bounds.max)

// 指定参数标签
func someFunction(argumentLabel parameterName: Int){
    //在函数体内, parameterName 代表参数值
}

// 可变参数 在变量类型名后加入... 表示 且一个函数最多只能拥有一个可变参数
func airthmeticMean(_ numbers: Double...) -> Double{
    var total = 0.0
    for number in numbers{
        total += number
    }
    return total/Double(numbers.count)
}
airthmeticMean(1, 2, 3, 4, 5)

// 输入输出参数 -> 函数参数默认是常量 加上 inout 关键字被函数修改后传出
// 输入输出参数不能有默认值  可变参数不能用 inout 修饰 入参需为可变参数
func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let tempA = a
    a = b
    b = tempA
}
var someInt = 3
var antherInt = 107
swapTwoInts(&someInt, &antherInt)
print("someInt is \(someInt), antherInt is \(antherInt)")


func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int{
    return a * b
}

//定义一个类型为函数的变量或常量
var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2, 3)

//有相同匹配类型的不同函数可以被赋值给同一个变量
mathFunction = multiplyTwoInts
mathFunction(2, 3)

// swift 可以自己做出类型推断
let antherMathFunction = addTwoInts
antherMathFunction(3, 4)



//函数类型作为参数类型
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 5, 7)


// 函数类型作为返回类型
//
func stepForward(_ input: Int) -> Int{
    return input + 1
}

func stepBackward(_ input: Int) -> Int{
    return input - 1
}
stepForward(2)
func chooseStepFunction(backward: Bool) -> (Int) -> Int{
    return backward ? stepBackward : stepForward
}

var currentValue = 3

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print(currentValue)
    currentValue = moveNearerToZero(currentValue)
}






















