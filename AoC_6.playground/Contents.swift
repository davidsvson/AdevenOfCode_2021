var inputArray = input.split(separator: ",").compactMap{ Int($0) }

for i in 1...80 {
    for index in 0..<inputArray.count {
        inputArray[index] -= 1
        if inputArray[index] < 0 {
            inputArray[index] = 6
            inputArray.append(8)
        }
    }
}

print(inputArray.count)
