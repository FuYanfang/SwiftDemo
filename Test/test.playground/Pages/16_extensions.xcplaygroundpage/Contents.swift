//: [内嵌类型](15_nestedTypes)
//: #扩展

import Foundation

//: 计算属性
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("three Feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//: 方法
extension Int {
    func repetitions(task:() -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

4.repetitions {
    print("Hello")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 4
someInt.square()

//: 下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimaBase = 1
        for _ in 0..<digitIndex {
            decimaBase *= 10
        }
        return self/decimaBase % 10
    }
}

459384503[4]

//: [17.协议](17_protocols)
