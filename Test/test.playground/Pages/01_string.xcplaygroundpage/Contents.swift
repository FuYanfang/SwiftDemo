//:[Swift 编程语言](https://www.cnswift.org/)
//:#01基础内容

import Cocoa

var str = "Hello, playground"

var optionalString:String?="Hello"
print(optionalString==nil)
var optionalName:String?=nil
var greeting="Hello!"
if let name=optionalName{
    greeting="Hello, \(name)"
} else {
   greeting = "name"
}


let vegetable="red pepper"
switch vegetable{
case"celery":
print("Add some raisins and make ants on a log." )
case"cucumber","watercress":
print("That would make a good tea sandwich." )
case let x where x.hasSuffix("pepper"):
print("Is it a spicy \(x)?")
default:
print("Everything tastes good in soup.")
}

func personEat(person:String, eat food:String) -> String {
    return "today \(person) eat \(food)"
}

personEat(person:"gaocheng",eat:"meat")

//let str = """
//  i am yanfang
//    from YIYANG
//    """

let emptyStr = "dog 🐩"
if emptyStr.isEmpty {
    print("空字符串")
} else {
    for characher in emptyStr {
        print (characher)
    }
}

var welcome = "welcome"
welcome.insert("!",at:welcome.endIndex)

//welcome.insert(" there".characher,at:welcome.endIndex)

var hello = "hello"

if welcome == hello {
    print("==")
} else {
    print("!=")
}

for codeUnit in emptyStr.utf8 {
    print("\(codeUnit) ",terminator:"")
}


//: [Next](02_array)
