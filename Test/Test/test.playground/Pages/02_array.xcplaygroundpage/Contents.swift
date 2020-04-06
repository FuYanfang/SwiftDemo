//: [Previous](01_string)
//:#02 集合类型

import Foundation

var someInts = [Int]()
someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items")

//: init repeat items
var threeDoubles = Array(repeating:4.4, count:3)
var otherThreeDoubles = Array(repeating:5.0, count:3)
var sixDoubles = threeDoubles + otherThreeDoubles

//: append
var shopingList = ["eggs", "milk"]
shopingList.append("apple")
shopingList += ["meat"]
shopingList += ["meat"]
shopingList += ["meat"]
shopingList += ["meat"]

shopingList[4...6] = ["orange", "bananas", "coco"]

print("shopingList is of type [Int] with \(shopingList.count) items")

shopingList.insert("hehe", at: 1)
shopingList.remove(at:4)
let shop = shopingList.removeLast()

for items in shopingList {
    print(items)
}


//: [Next](03_functions)

