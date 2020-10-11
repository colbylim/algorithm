import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var array = [[Int]](repeating: [Int](), count: arr1.count)
    for i in 0 ..< arr1.count {
        for j in 0 ..< arr2[0].count {
            var value: Int = 0
            
            for k in 0 ..< arr2.count {
                value += (arr1[i][k] * arr2[k][j])
            }
            
            array[i].append(value)
        }
    }
    
    return array
}



