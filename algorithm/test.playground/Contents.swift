//문제 설명
//함수 solution은 정수 n을 매개변수로 입력받습니다. n의 각 자릿수를 큰것부터 작은 순으로 정렬한 새로운 정수를 리턴해주세요. 예를들어 n이 118372면 873211을 리턴하면 됩니다.
//
//제한 조건
//n은 1이상 8000000000 이하인 자연수입니다.
import UIKit

func Fibonacci(Nth: Double) -> Double {
    if Nth == 1 || Nth == 2 {
        return 1
    }
    
    return Fibonacci(Nth: Nth - 1) + Fibonacci(Nth: Nth - 2)
}

func FibonacciNumberUsingWhile(Nth:Double) {
    var F1:Double = 1  // F1 초항 및 Fn = F(n-1) + F(n-2) 에서 작은 값 F(n-2)를 담당.
    var F2:Double = 1  // F1 초항 및 Fn = F(n-1) + F(n-2) 에서 큰 값 F(n-1)를 담당.
    var FN:Double = 1  // Fn을 담은 변수 선언
    var i:Double = 1   // while문을 돌리기 위해 시작 변수 선언
    
    while i <= Nth {
        if i == 1 || i == 2 { // F1, F2 까지는 i를 1씩 더해 반복문 조건만 채우고 나옴. (if문을 while 앞으로 빼고 var i = 3으로 시작해도 됨.
            print(F1)       // F1, F2일 때는 바로 F1의 값 1을 출력.
        } else {
            FN = F2 + F1    // F3부터 F(n-1) + F(n-2)를 수행.
            print(FN)   // 다음번 계산할 작은 값 F(n-2)에 현재의 큰 값 F(n-1)항 값을 넣는다.
            F1 = F2 // 다음번 계산할 큰 값 F(n-1)에 현재의 작은 값 F(n-2)항 값을 넣는다.
            F2 = FN // N번째 항까지 수행하기 위한 조건.
        }
        i += 1
    }
}

func FibonacciNumberUsingWhile(Nth:Double) -> (Double) {
    var F1:Double = 1  // F1 초항 및 Fn = F(n-1) + F(n-2) 에서 작은 값 F(n-2)를 담당.
    var F2:Double = 1  // F1 초항 및 Fn = F(n-1) + F(n-2) 에서 큰 값 F(n-1)를 담당.
    var FN:Double = 1  // Fn을 담은 변수 선언
    var i:Double = 1   // while문을 돌리기 위해 시작 변수 선언

    while i <= Nth {
        if i == 1 || i == 2 {
            i += 1
            continue    // F1, F2 까지는 i를 1씩 더해 반복문 조건만 채우고 나옴. (if문을 while 앞으로 빼고 var i = 3으로 시작해도 됨.
        } else {
            FN = F2 + F1 // F3부터 F(n-1) + F(n-2)를 수행.
            F1 = F2        // 다음번 계산할 작은 값 F(n-2)에 현재의 큰 값 F(n-1)항 값을 넣는다.
            F2 = FN        // 다음번 계산할 큰 값 F(n-1)에 현재의 작은 값 F(n-2)항 값을 넣는다.
            i += 1        // N번째 항까지 수행하기 위한 조건.
        }
    }
    return FN
}

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
