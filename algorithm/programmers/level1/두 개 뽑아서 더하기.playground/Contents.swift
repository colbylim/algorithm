//정수 배열 numbers가 주어집니다. numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.
//
//제한사항
//numbers의 길이는 2 이상 100 이하입니다.
//numbers의 모든 수는 0 이상 100 이하입니다.

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    if numbers.count < 2 || numbers.count > 100 {
        return []
    }
    
    if numbers.first(where: { $0 < 0 || $0 > 100 }) != nil {
        return []
    }
    
    var retValue: [Int] = [Int]()
    
    for (i, number) in numbers.enumerated() {
        for j in stride(from: i + 1, to: numbers.count, by: 1) {
            let value = number + numbers[j]
            if retValue.contains(value) {
                continue
            }
            
            retValue.append(value)
        }
    }
    
    return retValue.sorted()
}
