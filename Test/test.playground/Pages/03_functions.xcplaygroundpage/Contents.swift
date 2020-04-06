//: [Previous](02_array)
//: #函数

import Foundation

var str = "Hello, playground"

func greet(person: String) -> String {
    return "Hello, " + person + "!"
}

print(greet(person: "Anna"))
print(greet(person: "Kimi"))


func sayHelloWorld() -> String {
    return "Hello World!"
}
print(sayHelloWorld())


func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

printAndCount(string:"Yanfang.Fu")

//: ###无返回值函数
func printWithoutContine(string: String) {
    let _ = printAndCount(string:string)
}

printWithoutContine(string:"Gaocheng")


//: ###多返回值函数
func minMax(array: [Int]) -> (min: Int, max: Int) {

    var min = array[0]
    var max = array[0]
    for value in array {
        if value > max {
            max = value
        } else if value < min {
            min = value
        }
    }
    return(min, max)
}
let data = minMax(array:[3,5,1,-6,100,30])
print("min \(data.min)  max \(data.max)");


//: ###指定实际参数标签

func someFunction(_ firstName:String, lastName:String) -> String {
    return lastName + " " + firstName;
}

someFunction("Fu", lastName:"Yanfang")

//: ###默认形参
func someFunction1(_ paramsInt: Int = 12) {
    let num = paramsInt
}
someFunction1(6);
someFunction1(12);


//: ###输入输出形式参数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var aInt = 3;
var bInt = 6;
swapTwoInts(&aInt,&bInt)
print("someInt is now \(aInt), and anotherInt is now \(bInt)")

//: 函数式类型
func sumAB(_ a: Int, _ b: Int) -> Int {
    return a+b
}

func multiplyAB(_ a: Int, _ b: Int) -> Int {
    return a*b
}

var mathFunc: (Int, Int) -> Int = multiplyAB
print("mathFunc: \(mathFunc(4, 8))")


func printMatchFunc(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("printMatchFunc Result: \(mathFunc(a, b))")
}
printMatchFunc(multiplyAB, 3, 2)

//: ********
//:
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunc(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}


//: 内嵌函数
func chooseStepFunc2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}

var currentValue = 4
let moveNearerToZero = chooseStepFunc2(backwards: currentValue > 0)
print("Counting to zero:")
while currentValue != 0 {
    print("...\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

//: [Next](04_closures)
