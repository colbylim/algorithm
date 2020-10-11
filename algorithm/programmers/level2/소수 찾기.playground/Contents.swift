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

func solution(_ numbers:String) -> Int {
    let array = numbers.map({ String($0) })
    let size = array.count
    var primes = [Int]()
    dfs(max: size, numbers: array, depth: 0, value: "", retValue: &primes)
    
    var cnt = 0
    for n in primes {
        if isPrime(n: n) == true {
            cnt += 1
        }
    }
    
    return cnt
}

func dfs(max: Int, numbers: [String], depth : Int, value : String, retValue: inout [Int]) {
    guard max > depth else {
        return
    }
    
    var temp = numbers
    let count = numbers.count
    for i in 0 ..< count {
        let item = temp.remove(at: i)
        let newVlaue = value + item
        
        if let n = Int(newVlaue),
           !retValue.contains(n) {
            retValue.append(n)
        }

        dfs(max: max,
            numbers: temp,
            depth: depth + 1,
            value: newVlaue,
            retValue: &retValue)
        
        temp.insert(item, at: i)
    }
}

func isPrime(n: Int) -> Bool {
    if n == 0 || n == 1 {
        return false
    } else if n == 2 {
        return true
    }
    
    let value = Int(sqrt(Double(n)))
    for i in 2 ... value {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}
