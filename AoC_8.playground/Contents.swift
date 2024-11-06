//  Segments
//      1
//     2 3
//      4
//     5 6
//      7

let rows = input.split(separator: "\n")

var sum = 0;
for row in rows {
    let split = row.split(separator: "|")
    let leftSide = split[0].split(separator: " ").map{String($0).sorted()}.sorted{ $0.count < $1.count }
    let rightSide = split[1].split(separator: " ").map{String($0)}
    
    //segment 1
    // finns i count(3) ej count(2)
    let length3Letters = Set(leftSide[1].compactMap { $0 })
    let length2Letters = Set(leftSide[0].compactMap { $0 })
    let segment1 = length3Letters.subtracting(length2Letters).first!

    //segment2
    // unik i count(5) och finns i count(4)
    let length5Arrays = leftSide.filter { $0.count == 5 }
    let length4Arrays = leftSide.filter { $0.count == 4 }
    let length5Letters = Set(length5Arrays.flatMap { $0 })
    let length4Letters = Set(length4Arrays.flatMap { $0 })
    let segment2 = length5Letters.intersection(length4Letters).filter { letter in length5Arrays.filter { $0.contains(letter) }.count == 1}.first!

    //segment5
    // lettercount == 4
    let allLetters = leftSide.flatMap { $0 }
    let letterCounts = Dictionary(grouping: allLetters) { $0 }.mapValues { $0.count }
    let segment5 = (letterCounts.filter { $0.value == 4 }.first?.key)!

    //segment6
    //lettercount == 9
    let segment6 = (letterCounts.filter { $0.value == 9 }.first?.key)!

    //segment3
    //finns i count(2) ej segment6
    let index3 = leftSide[0].firstIndex(where: { $0 != segment6 })!
    let segment3 = leftSide[0][index3]

    //segment4
    //finns i count(4) ej i count(2)  ej segment2
    let s4 = length4Letters.subtracting(length2Letters)
    let index4 = s4.firstIndex(where: { $0 != segment2 })!
    let segment4 = s4[index4]

    //segment7
    let index7 = leftSide[9].firstIndex(where: { $0 != segment1 && $0 != segment2 && $0 != segment3 && $0 != segment4 &&
                                                   $0 != segment5 && $0 != segment6  })!
    let segment7 = leftSide[9][index7]


    let zero =  String((String(segment1) + String(segment2) + String(segment5) + String(segment7) + String(segment6) + String(segment3)).sorted())
    let one =   String((String(segment6) + String(segment3)).sorted())
    let two =   String((String(segment1) + String(segment3) + String(segment4) + String(segment5) + String(segment7)).sorted())
    let three = String((String(segment1) + String(segment3) + String(segment4) + String(segment6) + String(segment7)).sorted())
    let four =  String((String(segment2) + String(segment3) + String(segment4) + String(segment6) ).sorted())
    let five =  String((String(segment1) + String(segment2) + String(segment4) + String(segment6) + String(segment7) ).sorted())
    let six =   String((String(segment1) + String(segment2) + String(segment4) + String(segment5) + String(segment6) + String(segment7)).sorted())
    let seven = String((String(segment1) + String(segment3) + String(segment6)).sorted())
    let eight = String((String(segment1) + String(segment2) + String(segment3) + String(segment4) + String(segment5) + String(segment6) + String(segment7)).sorted())
    let nine =  String((String(segment1) + String(segment2) + String(segment4) + String(segment7) + String(segment6) + String(segment3)).sorted())


    let dict = [
        zero: "0",
        one: "1",
        two: "2",
        three: "3",
        four: "4",
        five: "5",
        six: "6",
        seven: "7",
        eight: "8",
        nine: "9"
    ]

    var value = ""
    for op in rightSide {
        let digit = String(op.sorted())
        
        let number = dict[digit] ?? "x"
        value += String(number)
    }
    sum += Int(value)!
}
print(sum)
