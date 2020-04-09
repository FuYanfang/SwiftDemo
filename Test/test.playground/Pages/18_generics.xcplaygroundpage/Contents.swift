//: [17.协议](17_protocols)
//: #泛型

import Foundation

//: #泛型函数
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporary = a
    a = b
    b = temporary
}

var someInt = 3
var anotherInt = 7
swap(&someInt, &anotherInt)
print("After swap someInt = \(someInt), anotherInt = \(anotherInt)")


struct Stack<E> {
    var items = [E]()
    mutating func push(_ item: E) {
        items.append(item)
    }
    mutating func pop() -> E {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("Home")
stackOfStrings.push("Class")
stackOfStrings.push("Video")

stackOfStrings.pop()

extension Stack {
    var topItem: E? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

let topItem = stackOfStrings.topItem

//Equatable  findIndex(of:in:)
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


//: -----
//: #不透明协议
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FilppedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FilppedShape(shape: smallTriangle)
print(flippedTriangle.draw())


//: [Next](@next)
