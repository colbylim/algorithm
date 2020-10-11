//문제 설명
//
//두 개의 단어 begin, target과 단어의 집합 words가 있습니다. 아래와 같은 규칙을 이용하여 begin에서 target으로 변환하는 가장 짧은 변환 과정을 찾으려고 합니다.
//1. 한 번에 한 개의 알파벳만 바꿀 수 있습니다.
//2. words에 있는 단어로만 변환할 수 있습니다.
//예를 들어 begin이 hit, target가 cog, words가 [hot,dot,dog,lot,log,cog]라면 hit -> hot -> dot -> dog -> cog와 같이 4단계를 거쳐 변환할 수 있습니다.
//두 개의 단어 begin, target과 단어의 집합 words가 매개변수로 주어질 때, 최소 몇 단계의 과정을 거쳐 begin을 target으로 변환할 수 있는지 return 하도록 solution 함수를 작성해주세요.
//제한사항
//각 단어는 알파벳 소문자로만 이루어져 있습니다.
//각 단어의 길이는 3 이상 10 이하이며 모든 단어의 길이는 같습니다.
//words에는 3개 이상 50개 이하의 단어가 있으며 중복되는 단어는 없습니다.
//begin과 target은 같지 않습니다.
//변환할 수 없는 경우에는 0를 return 합니다.

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var answer = [Int]()
    var visited = [Bool](repeating: false, count: words.count)
    
    func dfs(_ depth: Int, currWord: String) {
        for (i, word) in words.enumerated() {
            if visited[i] == true { continue }
            if isChangable(currWord, word) == false { continue }
            
            if target == word {
                answer.append(depth + 1)
                return
            }
            
            visited[i] = true
            dfs(depth + 1, currWord: word)
        }
    }
    
    dfs(0, currWord: begin)
    
    return answer.isEmpty == true ? 0 : answer.min()!
}

func isChangable(_ s1: String, _ s2: String) -> Bool {
    var check: Bool = false
    let loopCnt: Int = s1.count
    let arr1 = s1.map({ String($0) })
    let arr2 = s2.map({ String($0) })
    for i in 0 ..< loopCnt {
        if arr1[i] != arr2[i] {
            if check == true {
                return false
            }
            check = true
        }
    }
    
    return check
}
