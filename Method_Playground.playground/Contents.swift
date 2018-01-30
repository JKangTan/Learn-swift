//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
    func div(c count: Int) {
        self.count -= count
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 5)
print(counter.count)

// 值类型的属性不能再他的实例方法中修改 使用 mutating 修饰方法可改变
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY:Double) {
        y += deltaY
        x += deltaX
    }
    //类型方法
    static var sum = 0
    static func p(point: Point) {
       print("\(point.x+point.y)")
    }
}

var somePoint = Point(x:1.0, y:1.0)
somePoint.moveByX(deltaX: 3, y: 4)
print(somePoint.x, somePoint.y)

Point.p(point: somePoint)

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked (_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance (to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level+1)
        tracker.advance(to: level+1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Animo")
player.complete(level: 1)
print(LevelTracker.highestUnlockedLevel)

if player.tracker.advance(to: 4) {
    print("player is now on level 4")
}else {
    print("level 4 has not yet been unlock")
}


// 下标语法
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[6])


var garid = Array(repeatElement(0, count: 3))


class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
someVehicle.description

//继承
class Bicycle: Vehicle {
    var hasBasket = false
}

let biycle = Bicycle()
biycle.hasBasket = true
biycle.currentSpeed = 15.0
biycle.description


//重写 需要在重写定义的属性前面加上 overide 关键字

//重写方法
class Train: Vehicle {
    override func makeNoise() {
        print("guangchi guangchi")
    }
}

let train = Train()
train.makeNoise()

//重写属性
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}
//重写属性观察器

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35
automatic.description
//在关键字 func class var 前面添加 final 修饰符 可以防止被重写


// 构造器

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature

struct Celsius {
    var temperatureCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromLevin kelvin: Double) {
        temperatureCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureCelsius

let freezingPointOfWater = Celsius(fromLevin: 273.15)
freezingPointOfWater.temperatureCelsius

// 可选属性类型

class SurveyQuestion {
    var text: String
    var respone: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQ = SurveyQuestion(text: "Do you love cheese");
cheeseQ.ask()
cheeseQ.respone = "I do like cheese"

//结构体的逐一成员构造器 默认通过与属性相同命名的参数

let TwoByTwo = Size(width:2.0, height:2.0)

// 值类型的代理构造器
struct Size {
    var width = 0.0, height = 0.0
}

struct Points {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Points()
    var size = Size()
    init() {}
    init(origin: Points, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Points, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Points(x: originX, y: originY), size: size)
    }
}

// 类的继承和构造过程 指定构造器 和 便利构造器
// 便利构造器  convenience 指定构造器
// 指定构造器必须向上代理 便利构造器必须横向代理
// 两段式构造过程 指定构造器完成父类 本类的所有属性的初始化




































