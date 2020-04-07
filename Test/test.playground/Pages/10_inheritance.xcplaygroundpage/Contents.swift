//: [Previous](09_subscripts)
//: 继承

import Foundation

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
print("Vehicle:\(someVehicle.description)")


class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle:\(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.currentNumberOfPassengers = 2
tandem.hasBasket = true
tandem.currentSpeed = 20.0
print("Tandem:\(tandem.description)")

//: 重写 override
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 240
print("Car:\(car.description)")


//:属性观察器 willSet didSet
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let autoCar = AutomaticCar()
autoCar.currentSpeed = 200.0
print("AutomaticCar:\(autoCar.description)")

//: 阻止重写 final
//final var
//final func

//: [Next](11_initialization)
