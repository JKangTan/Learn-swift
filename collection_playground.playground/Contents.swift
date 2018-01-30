//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 集合类型 Arrays Sets Dictionaries

// 使用构造语法来创建一个有特定数据构成的空数组

var someInts = [Int]()

var threeDoubles = [Double](repeating: 0.0, count: 3)
var antherDoubles = [Double](repeating: 1.0, count: 3)

print(threeDoubles+antherDoubles)

var shopping: [String] = ["Eggs", "Milk", "Apple"]

// count
print(shopping.count)

//isEmpty 
print(shopping.isEmpty)

//append
shopping.append("Orange")
shopping += ["Flour"]

shopping[0] = "Six eggs"
shopping[2...4] = ["4", "5", "6"]

shopping.insert("First", at: 0)
shopping.remove(at: 4)
shopping.removeLast()//一处最后一个数据
print(shopping)

//shopping += shopping
for (index, value) in shopping.enumerated()
{
    print("Item \(String(index + 1)): \(value)")
}

// Sets
var letters = Set<Character>()
letters.insert("a")
letters = []

//创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// == var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("Blue")
//remove 方法删除一个元素 如果 set 中包含删除的元素则删除 并返回该元素的值 否则返回 nil

if let removedGenre = favoriteGenres.remove("Rock") {
    print(removedGenre)
}else{
    print("I never much cared for that")
}

if favoriteGenres.contains("Jazz") {
    print("Jazz is my favorite")
}else{
    print("I never much cared for that")
}

for item in favoriteGenres {
    print(item)
}

//有序排列 <
for item in favoriteGenres.sorted() {
    print(item)
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrime: Set = [2, 3, 5, 7]

// 并集
oddDigits.union(evenDigits).sorted()
// 交集
oddDigits.intersection(evenDigits).sorted()
// 不在该集合值的新集合
oddDigits.subtracting(singleDigitPrime).sorted()
// 在一个集合中但不在两个集合中的值创建一个新的集合
oddDigits.symmetricDifference(singleDigitPrime).sorted()
// isSubset() 判断一个集合中的值是否被包含在另外一个集合

//isSuperset() 判断一个集合中包含另一个集合中的所有值

//isDisjoint() 判断两个集合是否不含有相同的值


// 字典

var nameOfIntegers: [Int: String]


var airports: [String: String] = ["YYZ": "Toronto Person", "DUB": "Dublin"]
var ports = ["YYZ": "Toronto Person", "DUB": "Dbulin"]
airports["LHR"] = "London"          // 添加
airports["LHR"] = "London Heathrow" //修改

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

airports["APL"] = nil

// 移除键值对 如果存在则返回原始值 否则返回 nil
airports.removeValue(forKey: "DUB")

for (airPortCode, airPortName) in airports {
    print("\(airPortCode): \(airPortName)")
}

for airportCode in airports.values {
    print("Airport name: \(airportCode)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

let airportNames = airports.values.sorted()




















		
