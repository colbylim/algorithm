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
//        let a = solution("17")
        isPrime(n: 4)
        print()
    }

    func solution(_ numbers:String) -> Int {
        var resultArr: [Int] = [Int]()
        func perm(strs: inout [String], depth: Int) {
            if strs.count == depth {
                let num: Int = Int(strs.reduce("", { $0 + $1 }))!
                if !resultArr.contains(num) {
                    resultArr.append(num)
                }
                return
            }
            
            for i in depth ..< strs.count {
                //fatal error: swapping a location with itself is not supported
                if i != depth { strs.swapAt(i, depth) }
                perm(strs: &strs, depth: depth + 1)
                if i != depth { strs.swapAt(i, depth) }
            }
        }
        
        var strs = numbers.map { (c) -> String in
            let num = c.wholeNumberValue!
            if num > 1 && !resultArr.contains(num) {
                resultArr.append(num)
            }
            
            return String(c)
        }
        
        perm(strs: &strs, depth: 0)
        
        var count: Int = 0
        for number in resultArr {
            if isPrime(n: number) == true {
                count += 1
            }
        }

        return count
    }

    func isPrime(n: Int) -> Bool {
        if n == 2 { return true }
        for i in stride(from: 2, to: n, by: 1) {
            if n % i == 0 {
                return false
            }
        }
        
        return true
    }


}

