//: [Previous](12_optionalChaining)
//: #错误处理

import Foundation
enum VendingMachineError: Error {
    case invaildSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//: throw do-catch try try? try!
//: 使用抛出函数传递错误
//func canThrowErrors() throw -> String
//
//func cannotThowErrors() -> String

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = ["Candy Bar": Item(price: 12, count: 7),
                     "Chips": Item(price: 10, count: 4),
                     "Pretzels": Item(price: 7, count: 11)]
    var coninsDeposited = 0
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invaildSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coninsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coninsDeposited)
        }
        
        coninsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = ["Alice": "Chips",
                      "Bob": "Licorice",
                      "Eve": "Pretzels",]

func buyFavoriteSnak(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

var vendingMachine = VendingMachine()
vendingMachine.coninsDeposited = 15
do {
    try buyFavoriteSnak(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invaildSelection {
    print("Invaild Selection")
} catch VendingMachineError.outOfStock {
    print("out of stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}
do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}


func someThrowingFunction() throws -> Int {
    
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch  {
    y = nil
}

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    return nil
}

//buyFavoriteSnak(person: "Bobss", vendingMachine: vendingMachine)

//: 指定清理操作 defer
fun processFile(fileName: String) throws {
    if exists(fileName) {
        let file = open(fileName)
        defer {
            close(fileName)
        }
        while let line = try file.readline() {
            //
        }
    }
}


//: [Next](14_typeCasting)
