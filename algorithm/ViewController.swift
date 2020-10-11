//
//  ViewController.swift
//  algorithm
//
//  Created by Colby Lim on 2020/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let aa = [93, 30, 55]
//        let bb = [1, 30, 5]
//        let a = solution(2, 10, [7,4,5,6])
//        let a = solution([3, 0, 6, 1, 5])
//        let a = solution("011")
        
//        let a = solution(["I 16", "D 1"])
//        let b = solution(["I 7", "I 5", "I -5", "D -1"])
//        let a = solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
//        let a = solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
//        let a = solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL", "SFO"]])
        
//        print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]))
        
//        let a = ""
//        let b = "\(a.first!.uppercased())\(a.dropFirst().lowercased())"
        
        processTime {
            let a = solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])
            print("")
        }
    
//        processTime {
//            solution1([1,2,7,6,4])
//        }
        

        
//        print(solution([1,2], [3,4]))
        print("")
    }
    
    func solution(_ n:Int, _ edge:[[Int]]) -> Int {
        // 양방향 그래프의 정보를 기록할 2차원 배열
        var graph = [[Int]](repeating: [Int](), count: n + 1)
        // 방문여부 체크
        var visited = [Bool](repeating: false, count: n + 1)
        // 노드의 방문 거리 추치 별 빈도수
        var value = [Int](repeating: 0, count: n + 1)
        
        // 양방향 그래프를 설정
        for i in edge.indices {
            graph[edge[i][0]].append(edge[i][1])
            graph[edge[i][1]].append(edge[i][0])
        }
        
        bfs(&graph, &visited, &value)
        
        return 0
    }
    
    func bfs(_ graph: inout [[Int]], _ visited: inout [Bool], _ value: inout [Int]) {
        
    }
    
    func solution1(_ n: Int) -> Int {
        return n.nonzeroBitCount
    }

    func makeNumber(_ nums: [Int], _ depth: Int, _ answer: inout Int, _ visited: inout [Bool]) {
        if depth == 3 {
            
            print("\(nums[0 ..< 3]) : \(nums[0 ..< 3].reduce(0, +))")
            return
        }
        
        var tArr = nums
        for i in 0 ..< nums.count {
            if visited[i] == true { continue }
            if i == depth { continue }
            visited[i] = true
            tArr.swapAt(i, depth)
            makeNumber(tArr, depth + 1, &answer, &visited)
            visited[i] = false
        }
    }

    

    func processTime(_ blockFunction: () -> ()) {
        let startTime = CFAbsoluteTimeGetCurrent()
        blockFunction()
        let processTime = (CFAbsoluteTimeGetCurrent() - startTime) * 1000000000
        print("걸린 시간 = \(processTime)")
    }
}
