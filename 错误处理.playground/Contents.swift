//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum VendingMachingError: Error {
    case invalidSelection   //无效选择
    case insufficientFunds(coinsNeeded: Int)    //金额不足
    case outOfStock //缺货
}

//抛出还需5个硬币的错误
throw VendingMachingError.insufficientFunds(coinsNeeded: 5)

// throwing 函数传递错误 方法的返回值之前加 throws 表明可以在被调用时抛出错误并处理
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDesposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else{
            throw VendingMachingError.invalidSelection
        }
        
        guard item.count>0 else {
            throw VendingMachingError.outOfStock
        }
        
        guard item.price <= coinsDesposited else {
            throw VendingMachingError.insufficientFunds(coinsNeeded:item.price-coinsDesposited)
        }
        
        coinsDesposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = ["Alice": "Chips",
                      "Bob": "Licorice",
                      "Eve": "Pretzels"]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let  snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
//
// do-catch 处理错误

var vendingMachine = VendingMachine()
vendingMachine.coinsDesposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachingError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachingError.insufficientFunds(let coinsNeeded)
    {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

//将错误转换成可选值 try?
//禁用错误传递  try!

// 指定清理操作 defer
func processFile(fileName: String) throws {
    if exists(fileName) {
        let file = open(fileName)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            //处理文件
        }
        // close(file)
    }
}

















