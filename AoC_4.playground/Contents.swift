let numbers : [String] = numbersRaw.split(separator: ",").map{String($0)}

let allRows = boardsRaw.split(separator: "\n")

var boards = [[[String]]]()

func print(board: [[String]]) {
    for row in board {
        print(row)
    }
}


for j in 0..<allRows.count / 5 {
    var board = [[String]]()
    for i in 0...4 {
        let row = allRows[i + (5 * j)].split(separator: " ").compactMap { String($0)}
        board.append(row)
    }
    boards.append(board)
}

func mark(number: String) {
    for boardNr in boards.indices {
        for rowNr in boards[boardNr].indices {
            boards[boardNr][rowNr] = boards[boardNr][rowNr].map{ $0 == number ? "*" : $0 }
        }
    }
}

func checkWin() -> [[String]]? {
    for board in boards {
        for i in 0..<board.count {
            var countRow = 0
            var countCol = 0
            for j in 0..<board.count {
                if board[j][i] == "*" {
                    countRow += 1
                }
                if board[i][j] == "*" {
                    countCol += 1
                }
                if countRow == 5 || countCol == 5{
                    return board
                }
            }
        }
    }
    
    return nil
}

var winnigBoards = [[[String]]]()

for i in 0..<numbers.count {
    mark(number: numbers[i])
    var winnerBoard = checkWin()
    while winnerBoard != nil {
        var sum = 0
        for row in winnerBoard! {
            for value in row {
                if let val = Int(value) {
                    sum += val
                }
            }
        }
        
        
        if let index = boards.firstIndex(of: winnerBoard!) {
            boards.remove(at: index)
        }
        winnigBoards.append(winnerBoard!)
        
        print("\(sum) * \(numbers[i]) = \(sum * Int(numbers[i])!)")
       // print("winning: \(winnigBoards.count) boards: \(boards.count)")
        winnerBoard = checkWin()
    }
    
}


if let winnerboard = winnigBoards.last {
var sum = 0
for row in winnerboard {
    for value in row {
        if let val = Int(value) {
            sum += val
        }
    }
}
    print(sum)
}











