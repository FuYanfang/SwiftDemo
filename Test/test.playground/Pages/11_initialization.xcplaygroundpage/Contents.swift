//: [Previous](10_inheritance)
//: #初始化

import Foundation

//: 初始化器 init
//: 无实际参数标签的初始化形式参数 _

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFaherheit faherheit: Double) {
        temperatureInCelsius = (faherheit - 32)/1.8
    }
    init(_ kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFaherheit: 212)
let freezingPointOfWater = Celsius(273.15)

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0, blue: 1.0)
let halfGray = Color(white: 0.5)

//: 可选属性类型 ？
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print("SurveyQuestion: \(text)")
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese")
cheeseQuestion.ask()
cheeseQuestion.response = "I also like cheese. (But not with cheese.)"

//: 结构体初始化
struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2, height: 2)
let zeroByTwo = Size(height:2)

//: 便捷初始化 convenience  必须从相同的类里调用另一个初始化器&最终必须调用一个指定初始化器
//: 指定初始化  初始化器必须从它的直系父类调用指定初始化
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppintListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) * \(name)"
        output += purchased ? " √" : " ×"
        return output
    }
}

var breakfastList = [ShoppintListItem(),
                     ShoppintListItem(name: "Bacon"),
                     ShoppintListItem(name: "Eggs", quantity: 6)]
breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//: 可失败初始化 init(exactly: )
struct Animal {
    let specise: String
    init?(specise: String) {
        if specise.isEmpty {
            return nil
        }
        self.specise = specise
    }
}

let someCreature = Animal(specise: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.specise)")
}

let anonymousCreature = Animal(specise: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//: 必要初始化required
class SomeClass {
    required init() {
    }
}

class SomeSubClass: SomeClass {
    required init() {
        
    }
}

//: 通过闭包和函数来设置属性默认值
struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[row * 8 + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 0))
print(board.squareIsBlackAt(row: 7, column: 7))

//: 反初始化 deinit
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfConinRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfConinRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func recive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.recive(coins: coinsInPurse)
    }
}

var playerOne : Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne?.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")

//: [Next](12_optionalChaining)
