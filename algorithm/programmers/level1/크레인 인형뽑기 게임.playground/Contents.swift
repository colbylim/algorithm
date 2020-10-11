import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var dolls: [Int] = []
    var removeCnt: Int = 0
    var temp = board
    
    for move in moves {
        let j = move - 1
        for i in 0 ..< temp.count {
            let doll = temp[i][j]
            if doll == 0 {
                continue
            }
            
            if doll == dolls.last {
                dolls.removeLast()
                removeCnt += 2
            } else {
                dolls.append(doll)
            }
            
            temp[i][j] = 0
            break
        }
    }
    
    return removeCnt
}

func checkboard(_ board: [[Int]], _ horizontalSize: Int) -> Bool {
    for item in board {
        // board 배열은 2차원 배열로 크기는 5 x 5 이상 30 x 30 이하입니다.
        let size = item.count
        if size < 5 || size > 30 {
            return false
        }
        
        if size != horizontalSize {
            return false
        }
        
        // board의 각 칸에는 0 이상 100 이하인 정수가 담겨있습니다.
        if checkDoll(item) == false {
            return false
        }
    }
    
    return true
}

func checkDoll(_ dolls: [Int]) -> Bool {
    let check = dolls.filter { (doll) -> Bool in
        if doll < 0 || doll > 100 {
            return true
        }
        
        return false
    }
    
    if check.count > 0 {
        return false
    }
    
    return true
}

func checkMoves(_ moves:[Int], _ horizontalSize: Int) -> Bool {
    // moves 배열의 크기는 1 이상 1,000 이하입니다.
    if moves.count < 1 || moves.count > 1000 {
        return false
    }
    
    // moves 배열 각 원소들의 값은 1 이상이며 board 배열의 가로 크기 이하인 자연수입니다.
    let check = moves.filter { (move) -> Bool in
        if move > horizontalSize || move < 1 {
            return true
        }
        
        return false
    }
    
    if check.count > 0 {
        return false
    }
    
    return true
}
