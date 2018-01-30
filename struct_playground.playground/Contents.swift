//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Rank: Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String{
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRowValue = Rank.Ace.rawValue

let jack = Rank.Jack
func compareRank(r1: Rank, r2: Rank) -> Rank{
    return r1.rawValue > r2.rawValue ? r1 : r2
}
print(compareRank(r1: ace, r2: jack))


enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
//结构体与类相似, 最大的区别是 结构体传值 类传引用
struct Card{
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank:.Three, suit:.Spades)
print(threeOfSpades.simpleDescription())

enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}

let success = ServerResponse.Result("6:00 am", "7:09 pm");
switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "sunrise \(sunrise),sunset is \(sunset)"

case let .Failure(msg):
    print("failure \(msg)")

}


// 声明一个协议
protocol ExampleProtocol{
    var simpleDescription: String{ get }
    mutating func adjust()
}

class EmptyClass {

}

// 类 枚举 结构体都可以实现协议
class SimpleClass: EmptyClass, ExampleProtocol{
    var simpleDescription: String = "a very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let ad = a.simpleDescription

struct SimpleStruct: ExampleProtocol{
    var simpleDescription: String = "A simple struct"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStruct()
b.adjust()
let ab = b.simpleDescription


//extension 来为现有的类型添加功能
extension Int: ExampleProtocol{
    var simpleDescription : String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

var num1 = 49
num1.adjust()
num1.simpleDescription


// protocolValue 只能执行协议内方法 不能调用 simpleClass 的方法或属性
let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription

// 错误处理

enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

func  sendToPrinter(printerName: String) throws -> String{
    if printerName == "Never Has Toner"{
        throw  PrinterError.NoToner
    }
    return "job sent"
}
// do catch 捕捉错误
do{
    let printerResponse = try sendToPrinter(printerName: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.NoToner{
    print("HHHH")
} catch{
    print(error)
}
// try? 捕捉错误 将结果转换为可选的  错误会被抛弃结果为 nil
let printerFailure = try? sendToPrinter(printerName: "Never Has Toner")
let printerSuccess = try? sendToPrinter(printerName: "Never")


// 使用 defer 可以执行函数返回前最后执行的代码 无论函数是否抛出错误
var fridgelsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(itemName: String) -> Bool {
    fridgelsOpen = true
    defer {
        fridgelsOpen = false
    }
    let result = fridgeContent.contains(itemName)
    return result
}
fridgeContains(itemName: "banana")
print(fridgelsOpen)

// 泛型 在尖括号里写一个名字来创建一个泛型函数或者类型
func repeatItem <Item>(item: Item, numberofTimes: Int) -> [Item]{
    var  result = [Item]()
    for _ in 0..<numberofTimes{
        result.append(item)
    }
    return result
}
repeatItem(item: "knock", numberofTimes: 4)


//类型命名
typealias Tint = Int
let ta: Tint = 3

//元组 () 也可以用下标表示
let http404Error = (404, "Not Found")

let (statusCode, msg) = http404Error
print("The status code is \(statusCode)")
print("The msg is \(http404Error.1)")

let possibleNo = "123"
let convertNum = Int(possibleNo)
// convertNum 是一个可选类型的 Int
print(convertNum)

//answer 自动设为 nil
var answer: String?


//当确定可选类型确实包含值之后 你可以在可选名字的后面加一个感叹号来获取值
if convertNum != nil{
    print("convertNum has an integer value of \(convertNum!)")
}

//可选绑定
if let actualNum = Int(possibleNo){
    print(actualNum)
}else
{
    print("nil value")
}

if let firstNum = Int("12"), let secondNum = Int("21"){
    print("first = \(firstNum), second = \(secondNum)")
}

let possibleString: String? = "An optional string"
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString

if let definiteString = assumedString {
    print(definiteString)
}

//函数通过在声明中添加 throws 关键词来抛出错误消息
func makeASandwich() throws{
    //...
}
do {
    try makeASandwich()
    
}catch PrinterError.OutOfPaper{
    
}catch PrinterError.OnFire{

}

//断言
let age = 3
assert(age > 0, "A person's age cannot be lessThan zero")

























