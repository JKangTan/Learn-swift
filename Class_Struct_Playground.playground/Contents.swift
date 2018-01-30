//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
结构体和类的共同点:
    1.定义属性用于储存值
    2.定义方法用于提供功能
    3.定义下标操作使得可以通过下标语法来访问实例所包含的值
    4.定义构造器用于生成初始化值
    5.通过扩展以增加默认实现的功能
    6.实现协议以提供某种标准功能
 
类还有以下特点:
    1.允许一个类继承另一个类
    2.类型转换允许在运行时检查和解释一个类实例的类型
    3.析构器允许一个类实例释放任何其所被分配的资源
    4.引用计数允许对一个类的多次引用
 
 结构体总是通过被复制的方式在代码中传递, 不使用引用计数
 */

class SomeClass{
    //定义类
}

struct SomeStruct{
    //定义结构体
}

struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)
// swift 中可以直接设置结构体的子属性
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)

//构造器 所有结构体都有一个自动生成的成员逐一构造器,用于初始化新结构体实例中的成员属性
// 初始值可以通过属性的名称传递到成员逐一构造器之中
let vga = Resolution(width:640, height:480)

print("width = \(vga.width), height = \(vga.height)")


// 结构体和枚举是值类型

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd  // 拷贝 cinema 和 hd 是两个有相同值的不同实例

cinema.width = 2048
cinema.width = 1022
print("cinema width \(cinema.width),hd width \(hd.width)")

// 类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0


let alsoTenRighty = tenEighty //同一对象
alsoTenRighty.frameRate = 30.0

print(tenEighty.frameRate)


// 属性 
struct FixedLengthRange{
    var firstValue: Int
    let length: Int
}

//如果结构体实例是常量 则无法修改其属性 不管属性是否是变量类型
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length:3) //0 1 2
rangeOfThreeItems.firstValue = 6                // 6 7 8



// 延迟属性 lazy
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// importer 属性还没有被创建
print(manager.importer.fileName) //importer 属性被创建

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
}
// 只读属性可以去掉 get 关键字和花括号
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let random = Cuboid(width: 4, height: 5, depth: 3)
print(random.volume)

// 属性观察器 除延迟存储属性外的属性添加观察期
// willSet 观察器会将新的属性值作为常量参数传入 newValue
// didSet 会将旧的属性值作为参数传入 oldValue 方法内设置新值会覆盖旧值

class StepCounter {
    var totalSteps: Int = 0 {
        willSet (newValue){
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Forward to \(totalSteps)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 100

//全局变量是在函数、方法、闭包或任何类型之外定义的变量

// 类型属性语法
struct SomeStructure{
    static var storedType = "Some Value"
    static var computedType : Int{
        return 1
    }
}
// 获取类型属性
print(SomeStructure.storedType)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0{
        didSet{
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
















