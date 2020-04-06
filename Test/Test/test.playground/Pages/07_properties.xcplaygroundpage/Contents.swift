//: [Previous](06_class&Struct)
//: # 属性

import Foundation

//存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 3

//由于结构体是值类型。当一个值类型的实例被标记为常量时，该实例的其他属性也均为常量
let rangeOffourItems = FixedLengthRange(firstValue: 2, length: 4)
//rangeOffourItems.firstValue = 6


//lazy
class DataImporter {
    var fileName = "data.text"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")

print(manager.importer.fileName)

//计算属性
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + size.width / 2.0
            let centerY = origin.y + size.height / 2.0
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - size.width / 2.0
            origin.y = newValue.y - size.height / 2.0
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
let squareCenter = square.center
square.center = Point(x: 15, y: 15)

print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


struct CompactRect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            Point(x:origin.x + size.width / 2.0 ,
                  y: origin.y + size.height / 2.0)
        }
        set {
            origin.x = newValue.x - size.width / 2.0
            origin.y = newValue.y - size.height / 2.0
        }
    }
}

struct Box {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume : Double {
        return width * height * depth
    }
}

let box = Box(width: 4, height: 5, depth: 3)
print ("box volume \(box.volume)")


//: 属性观察者 willSet didSet  == newValue & oldValue


//: 属性包装
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue : Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height : Int
    @TwelveOrLess var width : Int
}

var rectangle = SmallRectangle()
rectangle.height = 10
rectangle.width = 20
//print("rectangle height is \(rectangle.height) , width is \(rectangle.width)")

//: [Next](@next)
