var inputArray = input.split(separator: "\n")

//var bitCounts = [Int](repeating: 0, count: inputArray[0].count)
//
//for binary in inputArray {
//    for i in 0..<binary.count {
//        let index = binary.index(binary.startIndex, offsetBy: i)
//        let bit = binary[index]
//        bitCounts[i] += Int(String(bit)) ?? 0
//    }
//}
//
//var gammaBinary = ""
//
//for bit in bitCounts {
//    if bit >= inputArray.count / 2 {
//        gammaBinary += "1"
//    } else {
//        gammaBinary += "0"
//    }
//}
//
//let epsilonGamma = gammaBinary.map{ $0 == "1" ? "0" : "1" }
//
//let gamma = Int(gammaBinary, radix: 2)!
//let epsilon = Int(epsilonGamma.joined(), radix: 2)!
//print("\(gamma) \(epsilon) \(gamma * epsilon)")

// ************* part2
func mostCommonBit(at i: Int ) -> Character {
    var bitCount = 0
    
    for binary in inputArray {
        let index = binary.index(binary.startIndex, offsetBy: i)
        let bit = binary[index]
        bitCount += Int(String(bit)) ?? 0
    }
    return Double(bitCount) >= Double(inputArray.count) / 2 ? "1" : "0"
}

var place = 0
while inputArray.count > 1 {
    let bit = mostCommonBit(at: place)
    inputArray = inputArray.filter {
        let bits = String($0)
        let index = bits.index(bits.startIndex, offsetBy: place)
        return bits[index] == bit
    }
    place += 1
}

let o = Int(inputArray[0], radix: 2)!
print(o)
