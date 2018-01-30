//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 循环引用
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}
class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person? // weak 解除强引用
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "john Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

unit4A = nil
john = nil

// 使用无主引用 无主引用在其他实例有相同或者更长 的生命周期时使用.
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var c1: Customer?
c1 = Customer(name: "john2")
c1!.card = CreditCard(number: 1234_5678_9102_3456, customer: c1!)

c1 = nil //c1 和 持有的 card 实例都会销毁

// 无主引用以及隐式解析可选属性

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var contry = Country(name: "Canada", capitalName: "Ottawa")

//闭包引起的循环引用
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: (Void) -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

//asHTML 属性持有闭包的强引用 闭包体内使用了 self,持有了实例
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML())

// 定义捕获列表
/*
 
lazy var someClosure: Void -> String = {
    [unowned self, weak delegate = self.delegate!] in // 这里是闭包的函数体
}
 
 */
// 1. 被捕获的引用不会变为 nil 使用无主引用 反之使用 弱引用

/*
 
 lazy var asHTML: Void -> String = {
 [unowned self] in
 if let text = self.text {
 return "<\(self.name)>\(text)</\(self.name)>"
 } else {
 return "<\(self.name) />"
 }
 }
 */



















