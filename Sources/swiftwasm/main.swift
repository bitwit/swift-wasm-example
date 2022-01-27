print("file start")
import JavaScriptKit
//import Foundation
import Geometry
import Graphs
import RandomDungeonGenerator
import RedECS
import RedECSBasicComponents

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(WASILibc)
import WASILibc
#endif

struct DungeonRoomTest: DungeonRoom {
    var rect: Rect
    init(rect: Rect) {
        self.rect = rect
    }
}

struct DungeonHallwayTest: DungeonHallway {
    var points: [Point]
    var rects: [Rect] = []
    init(points: [Point]) {
        self.points = points
    }
}

var generator = DungeonGenerator<DungeonRoomTest, DungeonHallwayTest>()
generator.runCompleteGeneration()
print(generator.dungeon.hallways)

var document = JSObject.global.document

let hallwayArray = JSObject.global.createArray!()
for hallway in generator.dungeon.hallways {
    let line = JSObject.global.createArray!()
    for hallwayPoint in hallway.points {
        var point = JSObject.global.createObject!()
        point.x = JSValue(floatLiteral: hallwayPoint.x)
        point.y = JSValue(floatLiteral: hallwayPoint.y)
        _ = JSObject.global.addItemToArray!(point, line)
    }
    _ = JSObject.global.addItemToArray!(line, hallwayArray)
}
_ = JSObject.global.drawLinesInCanvas!(hallwayArray)
_ = JSObject.global.sendMessage!(hallwayArray)

let roomArray = JSObject.global.createArray!()
for room in generator.dungeon.rooms {
    var rect = JSObject.global.createObject!()
    rect.x = JSValue(floatLiteral: room.rect.origin.x)
    rect.y = JSValue(floatLiteral: room.rect.origin.y)
    rect.width = JSValue(floatLiteral: room.rect.size.width)
    rect.height = JSValue(floatLiteral: room.rect.size.height)
    rect.color = "red"
    _ = JSObject.global.addItemToArray!(rect, roomArray)
}
_ = JSObject.global.drawRectsInCanvas!(roomArray)
_ = JSObject.global.sendMessage!(roomArray)

//JSObject.global.alert!("Swift is running in the browser!")

print("File end !!")
