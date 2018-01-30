//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    var residence: Residence?
}

class Residence {
//    var numOfRooms = 1
    var rooms = [Room]()
    var numOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil{
            return "\(buildingNumber!) \(street!)"
        } else {
            return nil
        }
    }
}

let john = Person()
//john.residence = Residence() //可选


if let roomCount = john.residence?.numOfRooms {
    print("john's residence has \(roomCount) rooms")
} else {
    print("unable to retrieve the number of rooms")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func createAddress () -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}
john.residence = Residence()
john.residence?.address = createAddress() //residence 返回nil 函数未执行

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

//在方法的可选返回值上进行可选链式调用
if let buildingIdentify = john.residence?.address?.buildingIdentifier() {
    print("\(buildingIdentify)")
}

















