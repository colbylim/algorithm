import Foundation

enum STATE {
    case up
    case down
    case right
    
    func dir() -> (x: Int, y: Int) {
        switch self {
        case .up:
            return (x: -1, y: -1)
        
        case .down:
            return (x: 1, y: 0)
            
        case .right:
            return (x: 0, y: 1)
        }
    }
    
    mutating func change() -> (x: Int, y: Int) {
        switch self {
        case .up:
            self = .down
            return dir()
            
        case .down:
            self = .right
            return dir()
                        
        case .right:
            self = .up
            return dir()
        }
    }
}

func solution(_ n:Int) -> [Int] {
    var map = [[Int]]()
    for i in 1 ... n {
        map.append([Int](repeating: 0, count: i))
    }

    var x: Int = 0
    var y: Int = 0
    var number: Int = 1
    var state: STATE = .down
    
    for i in 0 ..< n {
        for _ in i + 1 ..< n {
            map[x][y] = number
            let dir = state.dir()
            x += dir.x
            y += dir.y
            number += 1
        }
        
        map[x][y] = number
        number += 1
        
        let dir = state.change()
        x += dir.x
        y += dir.y
    }

    return map.flatMap { $0 }
}
