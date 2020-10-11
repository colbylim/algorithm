import Foundation

func solution(_ operations:[String]) -> [Int] {
    var array = [Int]()
    for operation in operations {
        let components = operation.components(separatedBy: " ")
        let value = Int(components[1])!
        
        switch components[0] {
        case "I":
            array.insert(value, at: bs(array, value: value))
            
        case "D":
            if array.isEmpty == true { continue }
            if value == 1 {
                array.removeLast()
            } else {
                array.removeFirst()
            }
            
        default:
            continue
        }
    }
    
    if array.isEmpty == true {
        return [0, 0]
    } else if array.count == 1 {
        let value = array[0]
        return [value, value]
    }
    
    return [array.first!, array.last!]
}

func bs(_ array: [Int], value: Int) -> Int {
    var min: Int = 0
    var max: Int = array.count - 1
    
    while min <= max {
        let mid = (min + max) / 2
        let midValue = array[mid]
        if midValue < value {
            min = mid + 1
        } else {
            max = mid - 1
        }
    }
    
    return min
}
