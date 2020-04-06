//: [Previous](05_enumerations)
//: #类和结构体

import Foundation

//: ###语法定义
struct Resolution {
    var width = 0
    var height = 0
}

class VideoModel {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0
    var name : String?
}

//: 结构体初始化
let someResolution = Resolution()
let someVideoModel = VideoModel()

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

//: 类是引用类型 引用同一个Viewmodel
let tenVideo = VideoModel()
tenVideo.resolution = hd
tenVideo.interlaced = true
tenVideo.frameRate = 25
tenVideo.name = "1080i"

let nineVideo = tenVideo
nineVideo.frameRate = 30

print("The frameRate property of tenVideo is now \(tenVideo.frameRate)")


//: 特征预算符
if (tenVideo === nineVideo) {
    print("tenVideo & nineVideo is the same VideoModel instance")
}

//: choose struct & class 结构体实例总是通过值来传递，而类实例总是通过引用来传递

//: [Next](07_properties)
