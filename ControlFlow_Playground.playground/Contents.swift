//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// For In

for index in 1...5 {
    print("\(index) x 5 = \(index * 5)")
}

// 如果你不需要区间序列的每一项的值 可以用下划线(_)代替来忽略这个值
var sum = 0
let base = 3

for _ in 1...10{
    sum += base
}
print(sum)


let finalSquare = 25
var board = [Int](repeatElement(0, count: finalSquare+1))
board[3] = 8; board[6] = 11; board[9] = 9; board[10] = 2
board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8

var square = 0
var diceRoll = 0
while square < finalSquare{
    //掷骰子
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
        //如果玩家还在棋盘,顺着梯子爬上去或者顺着蛇滑下去
        square += board[square]
    }
}
print("Game over!")

/*
    repeat {
 
    } while condition
 */

// switch 元组

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("\(somePoint.0, 0) is on the x-axis")
case (0, _):
    print("\(0, somePoint.1) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

// guard 条件满足执行语句 否则执行 else 内的语句
// 且 else 内必须包含 return continue break或者 throw 事件
func testGuard (){
    var conditionString: String?
    guard let condition = conditionString  else {
        print("Nothing")
        return
    }
}

testGuard()

if #available(iOS 10, *) {
    print("iOS 10 +")
}else{
    print("lower iOS 10")
}



















