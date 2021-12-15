let rows = testinput.split(separator: "\n")

var output = [[String]]()

let dict = [
    String("acedgfb".sorted()): "8",
    String("cdfbe".sorted()): "5",
    String("gcdfa".sorted()): "2",
    String("fbcad".sorted()): "3",
    String("dab".sorted()): "7",
    String("cefabd".sorted()): "9",
    String("cdfgeb".sorted()): "6",
    String("eafb".sorted()): "4",
    String("cagedb".sorted()): "0",
    String("ab".sorted()): "1"
]

print(dict)

for row in rows {
    let rightside = row.split(separator: "|")[1].split(separator: " ").map{String($0)}
    output.append(rightside)
}

var count = 0

for op in output {
    
    var value = ""
    for o in op {
        let digit = String(o.sorted())
        
        let number = dict[digit] ?? ""
        print("\(digit) \(number) ")
        value += dict[digit] ?? ""
       
       
        //*********** 1
//        if o.count ==  2 || o.count == 3 || o.count == 4 || o.count == 7 {
//            count += 1
//        }
    }
    
    count += Int(value) ?? 0
}

print(count)
