//: [Previous](11_initialization)
//: #可选链 ?

import Foundation

class Person {
    var residence : Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The Number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingID() -> String? {
        if buildingName != nil {
            return buildingName
        } else if (buildingNumber != nil && street != nil) {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

let john = Person()
//john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

func createAddress() -> Address {
    let someAddress = Address()
    someAddress.buildingNumber = "19"
    someAddress.street = "Jiu Xian Qiao Road"
    print(someAddress.buildingID())
    return someAddress
}

john.residence?.address = createAddress()

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

let johnHouse = Residence()
johnHouse.rooms.append(Room(name: "Living Room"))
johnHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnHouse

if let firstRoomName =  john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

john.residence?.address = createAddress()

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

if let buildingID = john.residence?.address?.buildingID() {
    print("John's building identifier is \(buildingID).")
}

//: [Next](@next)
