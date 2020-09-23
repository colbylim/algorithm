//문제 설명
//함수 solution은 정수 n을 매개변수로 입력받습니다. n의 각 자릿수를 큰것부터 작은 순으로 정렬한 새로운 정수를 리턴해주세요. 예를들어 n이 118372면 873211을 리턴하면 됩니다.
//
//제한 조건
//n은 1이상 8000000000 이하인 자연수입니다.
import UIKit

//func solution(_ n:Int64) -> Int64 {
//    if n < 1 || n > 8000000000 {
//        return 0
//    }
//
//    var array = [Int64]()
//    var number = n
//    while number > 0 {
//        array.append(number % 10)
//        number = number / 10
//    }
//
//    return Int64(array.sorted(by: { $0 > $1 }).map(String.init).joined()) ?? 0
//}

//문제 설명
//배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.
//
//예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면
//
//array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.
//1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.
//2에서 나온 배열의 3번째 숫자는 5입니다.
//배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.
//
//제한사항
//array의 길이는 1 이상 100 이하입니다.
//array의 각 원소는 1 이상 100 이하입니다.
//commands의 길이는 1 이상 50 이하입니다.
//commands의 각 원소는 길이가 3입니다.


func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var val: [Int] = [Int]()
    
    if array.count < 1 || array.count > 100 {
        return val
    }
    
    if commands.count < 1 || commands.count > 50 {
        return val
    }
    
    if array.filter( { $0 < 1 || $0 > 100 }).count > 0 {
        return val
    }
        
    if commands.filter({ $0.count != 3 }).count > 0 {
        return val
    }
    
    commands.forEach { (command) in
        let start: Int = command[0] - 1
        let end: Int = command[1]
        let index: Int = command[2] - 1
        let new: [Int] = array[start ..< end].sorted()
        val.append(new[index])
    }
    
    return val
}
