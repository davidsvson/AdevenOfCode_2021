var inputArray = input.split(separator: ",").compactMap{ Int($0) }

var buckets : [Int] = Array(repeating: 0, count: 9)

for i in inputArray.indices {
    let day1 = inputArray[i] - 1
    buckets[day1] += 1
}

for _ in 1...255 {
    let bucketZero = buckets[0]
    for i in 1..<buckets.count {
       buckets[i - 1]  = buckets[i]
    }
    buckets[8] = bucketZero
    buckets[6] += bucketZero
}

var count = buckets.reduce(0, +)

print(count)

//************* 1
//for _ in 1...80 {
//    for index in 0..<inputArray.count {
//        inputArray[index] -= 1
//        if inputArray[index] < 0 {
//            inputArray[index] = 6
//            inputArray.append(8)
//        }
//    }
//}
//
//print(inputArray.count)


