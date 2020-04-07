//: [Previous](08_methods)
//: 下标

import Foundation

//: 下标语法
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//: 下标选项
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row > 0 && row < rows && column > 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column))
            return grid[row * columns + column]
        }
        set {
            assert(indexIsValid(row: row, column: column))
            grid[row * columns + column] = newValue
        }
    }
}



//: [Next](10_inheritance)
