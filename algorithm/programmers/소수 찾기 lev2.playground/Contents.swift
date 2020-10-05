//문제 설명
//한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.
//
//각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.
//
//제한사항
//numbers는 길이 1 이상 7 이하인 문자열입니다.
//numbers는 0~9까지 숫자만으로 이루어져 있습니다.
//013은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.

import Foundation

// 수열
func solution(_ numbers:String) -> Int {
    var resultArr: [Int] = [Int]()
    func perm(strs: inout [String], depth: Int) {
        if strs.count == depth {
            let num: Int = Int(strs.reduce("", { $0 + $1 }))!
            if !resultArr.contains(num) {
                resultArr.append(num)
            }
            return
        }
        
        for i in depth ..< strs.count {
            //fatal error: swapping a location with itself is not supported
            if i != depth { strs.swapAt(i, depth) }
            perm(strs: &strs, depth: depth + 1)
            if i != depth { strs.swapAt(i, depth) }
        }
    }
    
    var strs = numbers.map({ String($0) })
    perm(strs: &strs, depth: 0)
    
    var count: Int = 0
    for number in resultArr {
        if isPrime(n: number) == true {
            count += 1
        }
    }

    return count
}

func isPrime(n: Int) -> Bool {
    if n == 2 {
        return true
    }
    
    let val = sqrt(Double(n))
    for i in stride(from: 2, to: val, by: 1) {
        if val.truncatingRemainder(dividingBy: i) == 0 {
            return false
        }
    }
    
    return true
}
