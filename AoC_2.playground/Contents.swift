let inputArray = input.split(separator: "\n")

var horzPos = 0
var depthPos = 0

// ************ Part1
//for command in inputArray {
//    let com = command.split(separator: " ")
//
//    let dist = Int(com[1])!
//
//    switch com[0] {
//    case "forward" :
//        horzPos += dist
//    case "down" :
//        depthPos += dist
//    case "up" :
//        depthPos -= dist
//    default:
//        break
//    }
//}

// ***** part2
var aim = 0

for command in inputArray {
    let com = command.split(separator: " ")

    let dist = Int(com[1])!

    switch com[0] {
    case "forward" :
        horzPos += dist
        depthPos += aim * dist
    case "down" :
        aim += dist
    case "up" :
        aim -= dist
    default:
        break
    }
}

print("\(horzPos) \(depthPos) \(horzPos * depthPos) ")

