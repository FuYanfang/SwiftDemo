//: [Previous](07_properties)
//: 方法

import Foundation

//: 实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1;
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 3)
counter.reset()

//: self 属性
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if (somePoint.isToTheRightOf(x: 1.0)) {
    print("This point is to the right of the line where x == 1.0")
}

//: 在实例方法中修改值的类型 方法前加关键字：mutating
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var point2 = Point2(x: 1.0, y: 1.0)
point2.moveBy(x: 2.0, y: 3.0)
print("The point2 is now at(\(point2.x), \(point2.y))")

//: 在异变方法里指定自身
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaX)
    }
}

var point3 = Point3(x: 3.0, y: 3.0)
point3.moveBy(x: 2.0, y: 3.0)
print("The point3 is now at(\(point3.x), \(point3.y))")

enum LightStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = LightStateSwitch.off
ovenLight.next()
ovenLight.next()

//: 类型方法
class someClass {
    class func someTypeMethod() {
        
    }
}
someClass.someTypeMethod()

struct LevelTracher {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlock(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracher.isUnlock(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var track = LevelTracher()
    let playerName: String
    func complete(level: Int) {
        LevelTracher.unlock(level + 1)
        track.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var playerA = Player(name: "Argyrios")
playerA.complete(level: 1)
print("highest unlocked level is now \(playerA.track.currentLevel)")


var player = Player(name: "Beto")
if player.track.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}


//: [Next](09_subscripts)
