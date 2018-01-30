//: Playground - noun: a place where people can play

import UIKit

enum Setting {
    case text(String)
    case int(Int)
    case bool(Bool)
}

var defaultSettings: [String:Setting] = [
    "Airplane Mode": .bool(true),
    "Name": .text("My iPhone"),
]
// 字典 Dictionary 两个字典的合并产生并集的扩展写法
extension Dictionary {
    mutating func merge<S>(_ other: S)
        where S: Sequence, S.Iterator.Element == (key: Key,value: Value){
            for (k,v) in other {
                self[k] = v
            }
    }
}

let addDic: [String: Setting] = ["address":.text("China")]
defaultSettings.merge(addDic)
print(defaultSettings)

//类似 Array() 的初始化方法扩展
extension Dictionary {
    init <S: Sequence> (_ sequence:S)
        where S.Iterator.Element == (key: Key,value: Value){
            self = [:]
            self.merge(sequence)
    }
}
let defalut = (1..<5).map{(key:"Alarm\($0)",value:false)} //返回一个键值对
print(defalut)
print(Dictionary(defalut))

// 保持字典结构的 map 方法
extension Dictionary{
    func mapValues<NewValue> (transform: (Value) -> NewValue) ->[Key: NewValue]{
        return Dictionary<Key, NewValue>(map{(key, value) in
            return (key, transform(value))
        })
    }
}

let stringSetting = defaultSettings.mapValues{ defaultSettings -> String in
    switch defaultSettings {
    case .text(let text): return text
    case .int(let num): return String(num)
    case .bool(let value): return String(value)
    }
}
print(stringSetting)

// hash 1.减少 hash 碰撞  2.快速 减少 hash 值得计算时间
// 将成员的 hash 值就行 异或 运算
struct Person {
    var name: String
    var zipCode: Int
    var birthday: Date
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name &&
        lhs.zipCode == rhs.zipCode &&
        lhs.birthday == rhs.birthday
    }
}

extension Person: Hashable {
    var hashValue: Int {
        return name.hashValue^zipCode.hashValue^birthday.hashValue
    }
}

// Set 理解为只有键值得 Dictionary ,通过 hash 表实现 ,拥有类似的特性和要求

let natural: Set = [1,2,3,4]
natural.contains(3)

//集合代数
let iPod: Set = ["iPod touch","iPod nano","iPod mini","iPod shuffle","iPod classic"]
let discontinuedIPods: Set = ["iPod mini","iPod classic"]
let currentIPods: Set = iPod.subtracting(discontinuedIPods)
print(currentIPods)

//在闭包中使用集合为数组去重
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter {
            if seen.contains($0) {
                return false
            }else {
                seen.insert($0)
                return true
            }
        }
    }
}
[1,2,3,6,12,1,3,4,5,6,4,6].unique()







