//: Playground - noun: a place where people can play

import Cocoa

/**
Vehicles can have different properties and functionality.

All Vehicles:
  - Have a speed at which they move
  - Calculate the duration it will take them to travel a certain distance

All Vehicles except a Motorcycle and a Container Ship:
  - Have an amount of Windows

Only Ground Vehicles:
  - Have an amount of wheels

Only Buses:
  - Have a seating capacity

Only Vessels:
  - Have a length

Create the following Vehicles types: Car, Bus, ContainerShip, Boat, Motorcycle

----

The solution below does not use protocols, it relies solely on subclassing. Can you use protocols to improve the solution?
**/

typealias KilometersPerHour = Double
typealias Kilometers = Double
typealias Hours = Double

protocol Vehicle {
    var speed: KilometersPerHour {get set}
    func travelDuration(distance: Kilometers)
}

extension Vehicle {
    var speed: KilometersPerHour {return 10}
//    var amountOfWindows
    func travelDuration(distance: Kilometers) -> Hours {return distance / speed}
}

extension Vehicle where Self: GroundVehicle {
    var speed: KilometersPerHour {return 30}
}

extension Vehicle where Self: Vessel {
    var speed: KilometersPerHour {return 60}
}

protocol GroundVehicle {
    var amountOfWindows: Int {get set}
}

protocol Vessel {
    var amountOfWindows: Int{get set}
}

//class Vehicle {
//  
//  var speed: KilometersPerHour = 0
//  
//  func travelDuration(distance: Kilometers) -> Hours {
//    return distance / speed
//  }
//  
//}
//
//
//class GroundVehicle: Vehicle {
//  
//  var wheels: Int = 0
//  
//}

class Car: Vehicle, GroundVehicle {
    var speed: KilometersPerHour = 0.0
    var amountOfWindows: Int = 0
  
}

class MotorCycle: Vehicle, GroundVehicle {
    var speed: KilometersPerHour = 0.0
    var amountOfWindows: Int = 0
}

class Bus: Vehicle, GroundVehicle {
    var speed: KilometersPerHour = 0.0
    var amountOfWindows: Int = 0
    var capacity: Int = 0

}

//class Vessel: Vehicle {
//  
//  var length: Int = 0
//  
//}
//
class Boat: Vehicle, Vessel {
  
  var amountOfWindows: Int = 0
  
}
//
class ContainerShip: Vehicle, Vessel {
  
}

var car = Car()
car.amountOfWindows = 6
car.speed = 120

var bus = Bus()
bus.amountOfWindows = 20
bus.speed = 100

var boat = Boat()
boat.amountOfWindows = 8
boat.speed = 30

var containerShip = ContainerShip()
containerShip.speed = 30

var motorcycle = MotorCycle()
motorcycle.speed = 130

let vehicles = [car, bus, boat, containerShip, motorcycle]

for v in vehicles {
  var amountOfWindowsSubstring = ""
  
  if let boat = v as? Boat {
      amountOfWindowsSubstring = " has \(boat.amountOfWindows) windows and"
  } else if let car = v as? Car {
      amountOfWindowsSubstring = " has \(car.amountOfWindows) windows and"
  } else if let bus = v as? Bus {
    amountOfWindowsSubstring = " has \(bus.amountOfWindows) windows and"
  }

  
  print("\(v.dynamicType)\(amountOfWindowsSubstring) needs \(v.travelDuration(100)) to travel 100 kilometers.")
}
