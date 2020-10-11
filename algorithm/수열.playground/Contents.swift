import Foundation

func solution(_ numbers:String) -> Int {
    var resultArr: [Int] = [Int]()
    let strings = numbers.map({ String($0) })
    perm(strs: strings, depth: 0, array: &resultArr)
    
    var count: Int = 0
    for number in resultArr {
        if isPrime(n: number) == true {
            count += 1
        }
    }

    return count
}

func perm(strs: [String], depth: Int, array: inout [Int]) {
    var strings = strs
    
    if strings.count == depth {
        let num: Int = Int(strings.reduce("", { $0 + $1 }))!
        if !array.contains(num) && isPrime(n: num) {
            array.append(num)
        }
        
        return
    }
    
    for i in depth ..< strings.count {
        if i != depth { strings.swapAt(i, depth) }
        perm(strs: strings, depth: depth + 1, array: &array)
    }
}

func isPrime(n: Int) -> Bool {
    if n == 2 {
        return true
    }
    
    let val = Double(n)
    let to = sqrt(Double(n))
    for i in stride(from: 2, to: to, by: 1) {
        if val.truncatingRemainder(dividingBy: i) == 0 {
            return false
        }
    }
    
    return true
}
