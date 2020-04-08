//: [错误处理](13_errorHandling)
//: #类型转换

import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [Movie(name: "Casablanca", director: "Michael Curtiz"),
               Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
               Movie(name: "Casablanca", director: "Michael Curtiz"),
               Song(name: "The One And Only", artist: "Chesney Hawkes"),
               Song(name: "Never Gonna Give You Up", artist: "Rick Astley")]

//: 类型检查 is
var movieCount = 0
var songCount = 0
for item in library {
    if item is Song {
        songCount += 1
    }
    if item is Movie {
        movieCount += 1
    }
}
print("movieCount:\(movieCount) songCount:\(songCount)")

//: 类型转换 as?可选 or as!确定
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir.\(movie.director)")
    }
    if let song = item as? Song {
        print("Song: \(song.name), by.\(song.artist)")
    }
}

//: Any 和 AnyObject 的类型转换
var things = [Any]()
things.append(0)
things.append(3.14159)
things.append("hello")
things.append((3, 5))
things.append(Song(name: "许嵩", artist: "全世界最好的你"))
things.append({(name: String) -> String in "Hello,\(name)"})

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case let someDouble as Double where someDouble > 0:
        print("someDouble: \(someDouble)")
    case let string as String:
        print("string:\(string)")
    case let (x, y) as (Int, Int):
        print("an (x, y) point at \(x), \(y)")
    case let song as Song:
        print("song:\(song.name), by\(song.artist)")
    case let method as (String) -> String:
        print(method("Yanfang"))
    default:
        print("something else")
    }
}


//: [内嵌类型](15_nestedTypes)
