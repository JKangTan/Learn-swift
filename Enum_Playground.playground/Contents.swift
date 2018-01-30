//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum CompassPoint: String{
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.west
// 可以隐式的省略类型名
directionToHead = .east

print(CompassPoint.west.rawValue)
// 使用 switch 语句匹配单个枚举值

switch directionToHead {
case .north:
    print(".north")
case .south:
    print(".south")
case .west:
    print(".west")
case .east:
    print(".east")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var proBarcode = Barcode.upc(8, 85909, 51226, 3)
proBarcode = .qrCode("Only Voodoo") //Barcode 类型的变量或者常量 同时只可以存 .upc或者 .qrCode

switch proBarcode {
case .upc(let a, let b, let c, let d):
    print("UPC:\(a),\(b),\(c),\(d)")
case .qrCode(let productCode):
    print("QR Code:\(productCode)")
}

// 原始值
enum ASCIIControlCHarater: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 使用原始值初始化枚举实例
let possiblePlanet = Planet(rawValue: 7)


//递归枚举
/*
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

*/

// 你可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的
indirect enum ArithmeticExpression{
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
print(sum)

func evaluate(_ expression: ArithmeticExpression) -> Int{
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

let ok = evaluate(sum)
print(ok)


















