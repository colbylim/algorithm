import Foundation

func solution(_ board:[[Int]]) -> Int {
    let xCnt = board.count
    let yCnt = board.first!.count
    
    if xCnt == 1 || yCnt == 1 {
        for x in 0 ..< xCnt {
            for y in 0 ..< yCnt {
                if board[x][y] == 1 {
                    return 1
                }
            }
        }
        return 0
    }
    
    var map = board
    var max: Int = 0
    
    for x in 1 ..< xCnt {
        for y in 1 ..< yCnt {
            var value = map[x][y]
            if value == 0 {
                continue
            }
            
            let lu = map[x - 1][y - 1] // 좌상
            let u = map[x - 1][y] // 상
            let l = map[x][y - 1] // 좌
            
            value += min(lu, u, l)
            map[x][y] = value
            if value > max {
                max = value
            }
        }
    }
    
    return max * max
}
