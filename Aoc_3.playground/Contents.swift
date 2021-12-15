var inputArray = input.split(separator: "\n").map{String($0)}

//var bitCounts = [Int](repeating: 0, count: inputArray[0].count)

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
func mostCommonBit(at i: Int,in array: [String] ) -> Character {
    var bitCount = 0

    for binary in array {
        let index = binary.index(binary.startIndex, offsetBy: i)
        let bit = binary[index]
        bitCount += Int(String(bit)) ?? 0
    }
    return Double(bitCount) >= Double(array.count) / 2 ? "1" : "0"
}

func filter(array: [String]) -> [String]{
    var place = 0
    var filteredArray = array
    while filteredArray.count > 1 {
        let bit = mostCommonBit(at: place,in: filteredArray )
        filteredArray = filteredArray.filter {
            let bits = Array($0)
            return bits[place] == bit
        }
        place += 1
    }
    return filteredArray
}

let arrayO = filter(array: inputArray)
let o = Int(arrayO[0], radix: 2)!

print(o)


//let place = 3
//let newArray = oldArray.filter{
//    $0[place] == "1"
//}
