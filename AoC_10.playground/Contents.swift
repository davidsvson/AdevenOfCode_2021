let rows = testinput.split(separator: "\n")

let pointsDict = [
    ")": 3,
    "]": 57,
    "}": 1197,
    ">": 25137
]

let open = ["(","[","{","<"]
let close = [")","]","}",">"]

let pair = [
    ")":"(",
    "]":"[",
    "}":"{",
    ">":"<"
]

for row in rows {
    var chars = Array(row).map{String($0)}
    var stack = [String]()
    let dir = 
    for char in chars {
        print(stack)
        if open.contains(char) {
            stack.append(char)
        } else if close.contains(char) {
            if stack.last == pair[char] {
                stack.popLast()
            } else {
                print("syntax error \(char)")
            }
                
        }
    }
}

