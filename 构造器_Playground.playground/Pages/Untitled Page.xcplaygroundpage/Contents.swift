//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 类的继承和构造过程 指定构造器 和 便利构造器
// 便利构造器  convenience 指定构造器
// 指定构造器必须向上代理 便利构造器必须横向代理
// 两段式构造过程 指定构造器完成父类 本类的所有属性的初始化

//构造器的继承和重写
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}
// 默认构造器总是类中的指定构造器 用来创建 numberOfWheels=0 的实例
let vehicle = Vehicle()
vehicle.description

// 子类

class Bicyle: Vehicle {
    override init() {  //与父类默认指定构造器匹配 要带上 override 关键字
        super.init()    // 调用父类的默认构造器 确保在修改 Bicyle 属性之前,继承的属性已经被初始化
        numberOfWheels = 2  //继承的属性在父类被初始化完成后 重新设值
    }
}

let bicyle = Bicyle()
bicyle.description

// 子类如果没有任何指定构造器 他将自动继承父类所有指定构造器
// 如果子类提供了所有父类指定构造器的实现(自定义或默认均可) ,他将自动继承父类所有的便利构造器


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food() // 调用便利构造器 横向调用指定构造器


class RecipeIngredient: Food{
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}/*
 尽管 RecipeIngredient 将父类的指定构造器重写为了便利构造器，它依然提供了父类的所有指定构造器的实现
 因此会自动继承父类的所有便利构造器。
 */


let r1 = RecipeIngredient(name: "tomato")
let r2 = RecipeIngredient()
r2.quantity
r2.name
let r3 = RecipeIngredient(name: "123", quantity: 2)


//三级类
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ?" !":" ?"
        return output
    }
}
//ShoppingListItem 没有定义构造器来为 purchased提供初始值 purchased 定义了默认值
//则自动继承所有父类的指定构造器和便利构造器

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//可失败构造器
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("giraffe")
}

// 子类可以重写父类的可失败构造器 可失败,不可失败均可
class Document {
    var name: String?
    // 该构造器创建了一个 name 属性的值为 nil 的 document 实例 init() {}
    init() {}
    
    // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例 init?(name: String) {
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

let a1 = AutomaticallyNamedDocument()
a1.name

// 使用强制解包来重写父类的可失败构造器
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

// required 必要构造器 表示子类必须实现该构造器 被子类重写时不需要添加 override 关键字

// 通过闭包或函数设置默认值
struct Checkerboard {
    let boardColors: [Bool] = {
        var tempBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8{
                tempBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return tempBoard
    }()
    
    func squareIsBlackAtRow(row: Int, colum: Int) -> Bool {
        return boardColors[(row * 8) + colum]
    }
}

let board1 = Checkerboard()
board1.boardColors
board1.squareIsBlackAtRow(row: 1, colum: 1)




















