import UIKit

var greeting = "Hello, playground"


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        if nums[i] <= target {
            let currentTarget = target - nums[i]
            for j in i..<nums.count {
                if nums[j] == currentTarget {
                    return [i,j]
                }
            }
        }
    }
    return []
}

func twoSumDict(_ nums: [Int], _ target: Int) -> [Int] {
    var maps: [Int:Int] = [:]
    for i in 0..<nums.count {
        let currentValue = nums[i]
        if let firstHalfIndex = maps[currentValue] {
            return [firstHalfIndex, i]
        }
        let currentTarget = target - currentValue
        maps[currentTarget] = i
    }
    return []
}


twoSumDict([-3,4,3,90], 0)
