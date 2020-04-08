//: [类型转换](14_typeCasting)
//: #内嵌类型

import Foundation

//: 内嵌类型的使用
struct BlackjackCard {
    enum Suit: Character {
        case spades = "♠", hearts = "♥", clubs = "♣", diamonds = "◇"
    }
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let frist: Int, second: Int?
        }
        var value: Values {
            switch self {
            case .ace:
                return Values(frist: 1, second: 11)
            case .jack, .queen, .king:
                return Values(frist: 10, second: nil)
            default:
                return Values(frist:self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue) "
        output += "value is \(rank.value.frist) "
        if let second = rank.value.second {
            output += "or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades:\(theAceOfSpades.description)")

let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
print(heartsSymbol)



//: [扩展](16_extensions)
