//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol FullyNamed{
    var fullName: String {get}
}
//遵循该协议必须提供 fullName 属性
struct Person: FullyNamed{
    var fullName: String
}
let john = Person(fullName: "John Appleseed")

//方法要求
protocol RandomNumberGenerator{
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")


protocol Togglable{
    mutating func toggle()
}

enum OnOffSwitch: Togglable{
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

//构造器
protocol SomeProtocol{
    init(someParameter: Int)
}
//必须加上 required 关键词 子类重写并满足协议要求时 还要加上 override
class SomeClass: SomeProtocol{
    required init(someParameter: Int) {
        //
    }
}

//协议作为类型
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    } }

// 代理模式
protocol DiceGame{
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate{
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakeAndLadders: DiceGame{
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](repeating: 0, count: finalSquare+1)
        board[03] = +08; board[06] = +11; board[09] = +02
        board[14] = -10; board[19] = -11; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGamaTracker: DiceGameDelegate{
    var numOfTutns = 0
    func gameDidStart(_ game: DiceGame) {
        numOfTutns = 0
        if game is SnakeAndLadders{
            print("Started a new game of Snakes and Ladders")
        }
         print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numOfTutns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("end")
    }
}

let game = SnakeAndLadders()
game.delegate = DiceGamaTracker()
game.play()

// 类型需要显示的遵循协议

protocol TextRepresentable{
    var textualDescription: String { get }
}

extension Dice: TextRepresentable{
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

struct Hamter{
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension SnakeAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

//可以通过空扩展体的扩展来遵循该协议
extension Hamter: TextRepresentable{}
let simonTheHamster = Hamter(name: "Simon")

//协议类型的集合
let things: [TextRepresentable] = [simonTheHamster, game]

//协议的继承 可以继承一个或多个协议
protocol InheritingProcotol: SomeProtocol, TextRepresentable{
    
}

//类类型专属协议 class 关键词出现在协议的继承列表的第一个
protocol SomeClassOnlyProtocol: class, InheritingProcotol{
    
}

// 协议合成 多个协议使用 & 符号进行组合
protocol Named{
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}

struct PersonTwo: Named, Aged{
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebraor: Named & Aged){
    print("Happy birthday, \(celebraor.name), you're \(celebraor.age) !")
}

let birthdayPerson = PersonTwo(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

//检查协议的一致性
protocol HasArea{
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415926
    var radius: Double
    var area: Double {return pi * radius * radius}
    init(radius: Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
//上面三个都是类 可以组委 AnyObject 存放在数组中
let objects: [AnyObject] = [
    Circle(radius: 2.0)
    ,Country(area:234610)
    ,Animal(legs: 4)
]

for object in objects {
    if let objWithArea = object as? HasArea{
        print("Area is \(objWithArea.area)")
    }else{
        print("Dosen't have an area")
    }
}

extension RandomNumberGenerator{
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator2 = LinearCongruentialGenerator()
print("\(generator.randomBool())")



























