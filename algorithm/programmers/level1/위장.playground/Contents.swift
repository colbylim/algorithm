import Foundation

func solution(_ clothes: [[String]]) -> Int {
    return Dictionary(grouping: clothes, by: { $0[1] })
        .map({ $0.value.count })
        .reduce(1, { $0 * ($1 + 1) }) - 1
}

let arr = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]
let a = solution(arr)
