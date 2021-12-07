let rows = input.split(separator: "\n")

struct Point {
    var x: Int
    var y: Int
}

struct Line {
    var start : Point
    var end : Point
}

var lines = [Line]()

for row in rows {
    let data = row.split(separator: " ")
    let d1 = data[0].split(separator: ",")
    let start = Point(x: Int(d1[0])!, y: Int(d1[1])!)
    
    let d2 = data[2].split(separator: ",")
    let end = Point(x: Int(d2[0])!, y: Int(d2[1])!)
    let line = Line(start: start, end: end)
    
    lines.append(line)
}

var diagram : [[Int]] = Array(repeating: Array(repeating: 0, count: 1000), count: 1000)

//****** draw lines
for line in lines {
    let sizeX = line.end.x - line.start.x
    let sizeY = line.end.y - line.start.y
    
    if sizeY == 0 {
        for i in min(line.start.x, line.end.x)...max(line.start.x, line.end.x) {
            diagram[i][line.start.y] += 1
        }
    } else if sizeX == 0 {
        for i in min(line.start.y, line.end.y)...max(line.start.y, line.end.y) {
            diagram[line.start.x][i] += 1
        }
    // left - up
    } else if sizeX > 0 && sizeY > 0 {
        for i in 0...sizeX {
            diagram[line.start.x + i][line.start.y + i] += 1
        }
    // right - down
    } else if sizeX > 0 && sizeY < 0 {
        for i in 0...sizeX {
            diagram[line.start.x + i][line.start.y - i] += 1
        }
    // left - up
    } else if sizeX < 0 && sizeY > 0 {
        for i in 0...abs(sizeX) {
            diagram[line.start.x - i][line.start.y + i] += 1
        }
    //left - down
    } else if sizeX < 0 && sizeY < 0 {
        for i in 0...abs(sizeX) {
            diagram[line.start.x - i][line.start.y - i] += 1
        }
    }
}

//******* check for overlaps
var overlaps = 0

for i in 0..<diagram.count {
    for j in 0..<diagram.count {
        if diagram[i][j] > 1 {
            overlaps += 1
        }
    }
}

print(overlaps)
