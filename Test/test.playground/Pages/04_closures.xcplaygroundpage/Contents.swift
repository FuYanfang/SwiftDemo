//: [Previous](03_functions)
//: 闭包
import Foundation

//: sorted 排序方法
let names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backword(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backword)
var forwordNames = names.sorted(by: {s1, s2 in return s1 < s2 })
//var reversedNames1 = names.sorted{&0 > &1}
//var forwordNames2 = names.sorted(by: <)

//: map
let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
 ]
let numbers = [16,58,510]
let numberStrings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    return output
}

//: [Next](05_enumerations)
