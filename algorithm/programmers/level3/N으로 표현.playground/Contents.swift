//문제 설명
//
//아래와 같이 5와 사칙연산만으로 12를 표현할 수 있습니다.
//12 = 5 + 5 + (5 / 5) + (5 / 5)
//12 = 55 / 5 + 5 / 5
//12 = (55 + 5) / 5
//5를 사용한 횟수는 각각 6,5,4 입니다. 그리고 이중 가장 작은 경우는 4입니다.
//이처럼 숫자 N과 number가 주어질 때, N과 사칙연산만 사용해서 표현 할 수 있는 방법 중 N 사용횟수의 최솟값을 return 하도록 solution 함수를 작성하세요.
//제한사항
//N은 1 이상 9 이하입니다.
//number는 1 이상 32,000 이하입니다.
//수식에는 괄호와 사칙연산만 가능하며 나누기 연산에서 나머지는 무시합니다.
//최솟값이 8보다 크면 -1을 return 합니다.

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var answer: Int = -1
    dfs(N, number, 0, 0, &answer)
    return answer
}

func dfs(_ n: Int, _ number: Int, _ depth: Int, _ value: Int, _ answer: inout Int) {
    if depth > 8 {
        return
    }
    

    if value == number {
        if depth < answer || answer == -1 {
            answer = depth
        }
        return
    }
    
    var right = 0
    for i in 0 ..< 8 {
        right = right * 10 + n
        dfs(n, number, depth + 1 + i, value + right, &answer)
        dfs(n, number, depth + 1 + i, value - right, &answer)
        
        if value != 0 {
            dfs(n, number, depth + 1 + i, value * right, &answer)
            dfs(n, number, depth + 1 + i, value / right, &answer)
        }
    }
}


//void dfs(int N, int number, int depth, int num) {
//    if (depth >= MAX) {
//        return;
//    }
//
//    if (num == number) {
//        minDepth = min(depth, minDepth);
//    }
//
//    int operand = 0;
//    for (int i = 1; i <= MAX; i++) {
//        operand = operand*10 + N;
//
//        dfs(N, number, depth + i, num + operand);
//        dfs(N, number, depth + i, num - operand);
//
//        if (num != 0) {
//            dfs(N, number, depth + i, num * operand);
//            dfs(N, number, depth + i, num / operand);
//        }
//    }
//}
