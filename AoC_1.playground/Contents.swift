let inputArray : [Int] = input.split(separator: "\n").compactMap{ Int($0) }

func countInc(array: [Int]) -> Int {
    var increases = 0
    for i in 1..<array.count {
        if array[i - 1] < array[i] {
            increases += 1
        }
    }
    return increases
}

var slidingSums = [Int]()

for i in 0..<inputArray.count - 2 {
    let slidingSum = inputArray[i] + inputArray[i + 1] + inputArray[i + 2]
    slidingSums.append(slidingSum)
}

let r1 = countInc(array: inputArray)
let r2 = countInc(array: slidingSums)

print(r1)
print(r2)

