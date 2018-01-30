//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let individua = [75, 43, 103]
var teamSore = 0
for score in individua {
    if score > 50 {
        teamSore += 3
    }else{
        teamSore += 1
    }
}

print(teamSore)

var optionalString : String? = nil//"Voodoo Love"
print(optionalString == nil)

var greeting = "Hello!"
if let name = optionalString {
    greeting = "Hello, \(name)"
}
print(greeting)

let nikeName: String? = nil
let fullName: String = "John appleseed"
let informalGreeting = "Hi, \(nikeName ?? fullName)"


let vegetable = "red peper"
switch vegetable {
case "celery":
    print("")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("peper"):
    print("\(vegetable)")
default:
    print("default")
}

let interestingNumbers = [
    "Prime":[2, 3, 4, 6, 12],
    "Fibo":[1, 1, 2, 3, 5, 8],
    "Square":[1, 4, 9, 16, 25]
]
var largest = 0
for (kind, numbes) in interestingNumbers {
    for num in numbes {
        if num > largest {
            largest = num
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n = n*2
}
print(n)

var m = 2
repeat {
    m = m * 2
}while m < 100
print(m)

var total = 0
for i in 0..<4 {    //不包括上限  ... 包括
    total += i
}
print(total)

total = 0
for i in 0...4 {    //不包括上限  ... 包括
    total += i
}
print(total)


func greet(_ person: String, on day: String) -> String{
    return "Hello \(person), today is \(day)"
}

print(greet("Tom", on: "Thus"))

func calculate(scores:[Int]) ->(min: Int,max: Int, sum: Int)
{
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores{
        if score > max {
            max = score
        }else if score < min{
            min = score
        }
        sum += score
    }
    return(min, max, sum)
}

let s1 = calculate(scores: [1,7,2,9,21,6])
print(s1.max,s1.min,s1.sum)


// agruments can also variables numbers

func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for m in numbers{
        sum += m
    }
    return sum
}

print(sumOf(numbers: 1,5,7,3,8))


func averageOf(nums: Int...) -> Double{
    var sum = 0
    for m in nums{
        sum += m
    }
    return Double(sum/nums.count)
}

print(averageOf(nums: 11,6,21,17))

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

func makeIncrementer() -> ((Int) -> Int)
{
    func addOne(number: Int) -> Int{
        return number + 1
    }
    return addOne
}

let six = makeIncrementer()
print(six(5))

func hasAnyMatches(list:[Int], condition:(Int) -> Bool) -> Bool
{
    for item in list{
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool
{
    return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(list: numbers, condition: lessThanTen)


numbers.map { (num: Int) -> Int in
    let result = 3 * num
    return result
}

numbers.map({num in 2 * num})

let sortNumbers = numbers.sorted{$0 > $1}


class Shape{
    var numOfSides = 0
    
    func simpleDes() -> String {
        return "A shape with \(numOfSides) sides"
    }
}

var shape = Shape()
shape.numOfSides = 5
shape.simpleDes()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDes() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

class Square: NamedShape{
    
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super .init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    var allLength: Double{
        get {
            return sideLength * 4
        }
        set {
            self.sideLength = newValue/4.0
        }
    }
    
    override func simpleDes() -> String {
        return "A square with sides of length \(numberOfSides)."
    }
}

let test = Square(sideLength: 5.2, name: "square")
test.allLength = 20
test.area()
test.simpleDes()
print(test.area(),test.simpleDes())

enum Rank: Int{
    case Ace = 1
    case Two, Three, Four, Five, Six
    case Jack, Queen, King
    func simpleDescription() -> String{
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
print(aceRawValue)

if let convertedRank = Rank(rawValue: 3){
    convertedRank.simpleDescription()
}

let rank2 = Rank(rawValue: 1)
rank2?.simpleDescription()

















		
