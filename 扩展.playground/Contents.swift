//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 使用 extension 来声明扩展
extension Double {
    var mm: Double {return self/1000.0}
}

let oneInch = 25.4.mm

// 构造器
struct Size {
    var width = 0.0, height = 0.0
}
struct  Point {
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - size.width/2
        let originY = center.y - size.width/2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4, y: 4), size: Size(width: 4, height: 4))

//方法
extension Int {
    func repetitions(task: () -> Void){
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("hello!")
}

//嵌套类型
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind{
        switch self {
        case 0:
            return .Zero
        case let x where x>0:
            return .Positive
        default:
            return .Negative
        }
    }
}
func printIntegerKinds(_ numbers: [Int]){
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ")
        case .Positive:
            print("+ ")
        default:
            print("0 ")
        }
    }
    print(" ")
}
printIntegerKinds([3,19,-27,0,-6,0,7])


























