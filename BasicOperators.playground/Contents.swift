//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Swift 的赋值操作并不返回任何值
//当元组内的值可以比较时,元组也可以比较大小. Int, String 类型的值可以比较
(1, "hello") < (2, "nike")
(3, "apple") < (3, "bird")

let defaultColor = "orange"
var userDefinedColor: String?
var color = userDefinedColor ?? defaultColor


//闭区间运算符
for index in 1...5{
    print("\(index)")
}
//半开区间运算符
for index in 1..<5{
    print("\(index)")
}
let names = ["Alex", "Anna", "Brian", "Jack"]
for i in 0..<names.count{
    print("name's is \(names[i])")
}


// String and Characters 字符串和字符
//初始化空字符串  两者等价
var emptyString1 = ""
var emptyString2 = String()

if emptyString1.isEmpty && emptyString2.isEmpty{
    print("Nothing to see here")
}

for char in "Dog!🐶".characters {
    print(char)
}
let exclamatinMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
print(String(catCharacters))

// 连接字符串和字符
// 两个字符串可以通过加法运算符连接在一起

let string1 = "hello"
let string2 = " there"
print("\(string1+string2)")

var instruction = "look over"
instruction += string2
print("\(instruction)")

instruction.append(exclamatinMark)

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"

// cafe 的长度并没有改变
var word = "cafe"
word += "\u{301}"
print("\(word) number characters is \(word.characters.count)")

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//访问字符串中的单个字符
for index in greeting.characters.indices{
    print("\(greeting[index])", terminator:"")
}

//插入和删除

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
print("\n\(welcome)")

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)


//字符串比较  ==  != 前缀/后缀相等 hasPrefix(_:) hasSuffix(_:)

if eAcute == combinedEAcute {
    print("\u{E9}==\u{65}\u{301}==é")
}

if welcome.hasPrefix("hel") {
    print(welcome)
}

let dogString = "Dog!!🐶"
for codeUnit in dogString.utf8 {
    print(codeUnit)
}













































