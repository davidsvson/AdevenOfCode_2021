
let inputArray : [Int] = input.split(separator: ",").compactMap{ Int($0) }

let sum = inputArray.reduce(0, +)

//let median = inputArray.sorted()[inputArray.count / 2]

var costs = [Int]()

for dest in inputArray.min()!...inputArray.max()! {
    var total = 0
    for value in inputArray {
        let dist = abs(value - dest)
        total += (dist * dist + dist) / 2
    }
    costs.append(total)
}

print(costs.min())

