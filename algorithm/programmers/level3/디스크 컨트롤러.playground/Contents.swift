import Foundation

//func solution(_ jobs:[[Int]]) -> Int {
//    var sortedJob = jobs.sorted { (first, second) -> Bool in
//        if first[1] < second[1] {
//            return true
//        } else if first[1] == second[1] {
//            if first[0] < second[0] {
//                return true
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
//    }
//
//    var time: Int = 0
//    var total : Int = 0
//    while sortedJob.count > 0 {
//        for i in 0 ..< sortedJob.count {
//            if sortedJob[i][0] <= time {
//                time = time + sortedJob[i][1]
//                total = total + time - sortedJob[i][0]
//                sortedJob.remove(at: i)
//                break
//            }
//
//            if i == sortedJob.count - 1 {
//                time = time + 1
//            }
//
//        }
//    }
//
//    return total / jobs.count
//}

struct Work: Comparable {
    let arrivedTime: Int
    let processTime: Int

    static func < (_ lhs: Work, _ rhs: Work) -> Bool {
        return lhs.processTime < rhs.processTime
    }
}

extension Array where Element == Work {
    mutating func binaryInsert(_ element: Work) {
        if isEmpty {
            self.append(element)
        } else {
            var left = 0
            var right = count-1

           while left <= right {
                let mid = (left+right)/2

                if self[mid]<element {
                    left = mid+1
                } else {
                    right = mid-1
                }
            }

            self.insert(element, at: left)
        }
    }
}

func solution(_ jobs:[[Int]]) -> Int {
    let sorted = jobs.sorted {
        if $0[0] != $1[0] {
            return $0[0] < $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }

    guard let first = sorted.first else {
        return 0
    }

    var time: Int = first[0]
    var watingTime: Int = 0
    var pq: [Work] = [Work(arrivedTime: first[0], processTime: first[1])]
    var cursor = 1

    while cursor < sorted.count || !pq.isEmpty {
        if pq.isEmpty {
            time = sorted[cursor][0]
            pq.binaryInsert(Work(arrivedTime: sorted[cursor][0],
                                 processTime: sorted[cursor][1]))
            cursor += 1
        } else {
            let nextWork = pq.removeFirst()
            time += nextWork.processTime
            watingTime += time - nextWork.arrivedTime
            while cursor < sorted.count,
                  sorted[cursor][0] <= time {
                pq.binaryInsert(Work(arrivedTime: sorted[cursor][0],
                                     processTime: sorted[cursor][1]))
                cursor += 1
            }
        }
    }

    return watingTime / sorted.count
}

func solution1(_ jobs:[[Int]]) -> Int {
    let sorted = jobs.sorted {
        if $0[0] != $1[0] {
            return $0[0] < $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }
    
    guard let first = sorted.first else {
        return 0
    }
    
    var time: Int = first[0]
    var watingTime: Int = 0
    var index: Int = 1
    var pq = [[Int]]()
    pq.append(first)
    
    while index < sorted.count || !pq.isEmpty {
        if pq.isEmpty == true {
            let item = sorted[index]
            time = item[0]
            pq.append(item)
            index += 1
        } else {
            let item = pq.remove(at: 0)
            time += item[1]
            watingTime += time - item[0]
            
            while index < sorted.count,
                sorted[index][0] <= time {
                let newItem = sorted[index]
                pq.insert(newItem,
                          at: binarySearch(array: pq, item: newItem))
                
                index += 1
            }
        }
    }
    
    return watingTime / sorted.count
}

func binarySearch(array: [[Int]], item: [Int]) -> Int {
    var min: Int = 0
    var max: Int = array.count - 1
    
    while min <= max {
        let mid = (min + max) / 2
        let midValue = array[min]
        
        if midValue[1] < item[1] {
            min = mid + 1
        } else {
            max = min - 1
        }
    }
    
    return min
}
