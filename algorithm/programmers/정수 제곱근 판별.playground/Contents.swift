//문제 설명
//임의의 양의 정수 n에 대해, n이 어떤 양의 정수 x의 제곱인지 아닌지 판단하려 합니다.
//n이 양의 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 양의 정수 x의 제곱이 아니라면 -1을 리턴하는 함수를 완성하세요.
//
//제한 사항
//n은 1이상, 50000000000000 이하인 양의 정수입니다.

import Foundation

func solution(_ n:Int64) -> Int64 {
    if n < 1 || n > 50000000000000 {
        return -1
    }
    
    let _sqrt: Int64 = Int64(sqrt(Double(n)))
    
    if n != _sqrt * _sqrt {
        return -1
    }
    
    let value: Int64 = _sqrt + 1
    return value * value
}

func solution1(_ n:Int64) -> Int64 {
    if n < 1 || n > 50000000000000 {
        return -1
    }
    
    var value: Double = Double(n) / 2.0
    var i: Double = 1
    
    while true {
        let t = value - i
        if t < 0 {
            break
        }
        
        value = t
        i += 1
    }
            
    value *= 2
    
    var val: Int64 = Int64(value)
    if (val * val) != n {
        return -1
    }

    val += 1
    return val * val
}
