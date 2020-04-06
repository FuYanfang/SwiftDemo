//: [Previous](04_closures)
//: 枚举

import Foundation

enum CompassPont {
    case North
    case South
    case East
    case West
}

var directionToHead = CompassPont.West
directionToHead = .East

switch directionToHead {
    case .East:
    print("directionToEast")
    default:
    print("....")
}

//CaseIterable 允许遍历
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let number = Beverage.allCases.count
print ("Beverage count: \(number)")

//商品条形码&二维码
enum BarCode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarCode = upc(22, 44, 33, 11)
productBarCode.qrCode = "uareerrrr"



//: [Next](06_class&Struct)
