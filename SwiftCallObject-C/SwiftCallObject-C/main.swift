//
//  main.swift
//  SwiftCallObject-C
//
//  Created by 宋小伟 on 2022/10/10.
//  Copyright © 2022 GarveyCalvin. All rights reserved.
//

import Foundation

let cInt: CInt = 10
let cChar: CChar = 49

let ten = global_ten
print(ten)

extension TrafficLightColor {
    static var blue: TrafficLightColor {
        return TrafficLightColor(rawValue: "Blue")
    }
}

let redColor: TrafficLightColor = .red
let redColorRawValue = redColor.rawValue
print(redColorRawValue)

extension Shape {
    static var ellipse: Shape {
        return Shape(4)
    }
}

let e: Shape = .ellipse

let two = 2
_ = add(CInt(two), 3)

_ = vsum(3, getVaList([1,2,3]))

_ = withVaList([1, 2, 3], {
    vsum(3, $0)
})

var origin = Location()
var oneone = Location(xy: 1)

origin.moveX(delta: 11)

Location.origin.x = 11

let a = ASCII(character: 61)

let bmw = Car(.init(series: 5), info: .init(pricing: 50000, isAvalable: true))
print(bmw.series)

let r: TraffcLightColor = .RED
print(r.rawValue)

extension UnsafeMutablePointer where Pointee: CustomStringConvertible {
    func dump(count: Int) -> Void {
        var info = ""
        
        for i in 0 ..< count {
            info += self[i].description + " "
        }
        
        print(info)
    }
}

var intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 10)
intPtr.initialize(to: 0)

var head = intPtr
head.dump(count: 10)

for i in 1 ... 10 {
    //intPtr[i-1] = i
   // (intPtr + (i-1)).pointee = i
    intPtr += 1
    intPtr.predecessor().pointee = i
}

head.dump(count: 10)

print(intPtr.distance(to: head))

var buffer = UnsafeMutableBufferPointer(start: head, count: 10)
print(buffer.isEmpty)

let m = buffer[0]
print(m)
let n = buffer[0...5]
for i in n {
    print(i)
}

let first = buffer.first
print(first!)
let six = buffer.first(where: { $0 > 5})
print(six!)
let last = buffer.last
print(last!)

buffer.sort(by: <)
_ = buffer.sorted(by: >)

buffer.reverse()
let reversed = buffer.reversed()
[Int](reversed)

_ = buffer.map { $0 * 2 }
_ = buffer.filter { $0 % 2 == 0 }
_ = buffer.reduce(0, +)

var iter = buffer.makeIterator()

while let value = iter.next() {
    print(value)
}



head.deinitialize(count: 10)
head.deallocate()


var ten2: CInt = 10
doubler(&ten2)
print(ten2)
printAddress(&ten2)

withUnsafePointer(to: &ten2) {
    print( $0.pointee )
}

withUnsafeMutablePointer(to: &ten2) {
    $0.pointee = 30
}

let rawPointer = malloc(10 * MemoryLayout<Int>.size)!
let intPtr2 = rawPointer.bindMemory(to: Int.self, capacity: MemoryLayout<Int>.size * 5)

let bindedRawPointer = UnsafeMutableRawPointer(&ten2)
let tenPointer = bindedRawPointer.assumingMemoryBound(to: CInt.self)

let intPtr3 = UnsafeMutablePointer<CInt>.allocate(capacity: 1)
intPtr3.initialize(to: 0x12345678)

intPtr3.withMemoryRebound(to: Int8.self, capacity: 4) {
    print($0[0])
    print($0[1])
    print($0[2])
    print($0[3])
}

class Foo {
    var foo = "Foo"
    
    init() {
        print("Foo get initalzied.")
    }
    
    deinit {
        print("Foo gets released.")
    }
}

if true {
    let fooObj = Foo()
    let unmanagedFoo = Unmanaged.passRetained(fooObj)
    let unmanagedPtr = unmanagedFoo.toOpaque()
    
    aFuncWithCallBack(unmanagedPtr, {
        (ptr: UnsafeMutableRawPointer!) -> Void in
        let fooObj = Unmanaged<Foo>.fromOpaque(ptr).takeRetainedValue()
        print(fooObj.foo)
    })
}

fputs("Hello world\n", stdout)
"Hello world".withCString({
    debugPrint($0.debugDescription)
})

let asciiOfA = UInt8(ascii: "A")

print(String(describing: UnicodeScalar(asciiOfA)))
