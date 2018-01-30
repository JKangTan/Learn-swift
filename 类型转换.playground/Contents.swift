//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//定义媒体基类
class MediaItem{
    var name: String
    init(name: String) {
        self.name = name
    }
}
//媒体子类
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// 数组 library 的类型被推断为 [MediaItem] 取出的是 MediaItem 类型 需要向下转换它们到其他类型

var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}
print(movieCount,songCount)


// 向下转型 用类型转换操作符 as?  或 as!
for item in library {
    if let movie = item as? Movie {
        print("movie:\(movie.name),dir is \(movie.director)")
    }else if let song = item as? Song{
        print("Song: \(song.name),by \(song.artist)")
    }
}


// Any 和 AnyObject 的类型转换 Any 表示任何类型,包括函数类型 AnyObject 表示任何类类型的实例
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })


for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
//嵌套类型
struct BlackjackCard {
    // 嵌套的 Suit 枚举
    enum Suit: Character {
        case Spades = "♣️", Hearts = "♥️", Diamonds = "♦️", Clubs = "♠️"
    }
    //嵌套的  Rank 枚举
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue) "
        output += "value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
//逐一成员构造器
let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Hearts)
print(theAceOfSpades.description)

// 引用嵌套类型
let heartsSymbol =  BlackjackCard.Suit.Hearts.rawValue

























