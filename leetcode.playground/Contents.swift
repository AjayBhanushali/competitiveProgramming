func maxProfit(_ prices: [Int]) -> Int {
    guard var min = prices.first else {
        return 0
    }
    var max = min
    var maxProfit = 0
    
    for day in 0..<prices.count {
        let price = prices[day]
        if price < min {
            min = price
            max = 0
            continue
        }
        
        if price > max {
            max = price
            let newMaxProfit = max - min
            if newMaxProfit > maxProfit {
                maxProfit = newMaxProfit
            }
            continue
        }
    }
    
    return maxProfit
}

maxProfit([3,2,6,5,0,3])
maxProfit([7,1,5,6,4])
maxProfit([7,6,4,3,1])
maxProfit([2,4,1])

func maxSubArray(_ nums: [Int]) -> Int {
    var max: Int = nums.reduce(0, +)
    
    var startIndex = 0
    var newLength = nums.count-1
    
    var thatArray: Array<Int>.SubSequence?
    
    for _ in 0..<nums.count {
        for _ in 0..<nums.count-newLength {
            let sum = nums[startIndex...(startIndex+newLength)].reduce(0, +)
            
            if sum > max {
                thatArray = nums[startIndex...(startIndex+newLength)]
                max = sum
            }
            startIndex += 1
        }
        startIndex = 0
        newLength -= 1
    }
    print(thatArray)
    return max
}

maxSubArray([50,-2,1,-3,48,-1,2,1,-5])

func maxSub(_ nums: [Int]) -> Int {
    var max: Int = nums.reduce(0, +)
    
    var startIndex = 0
    var newLength = nums.count-1
    
    var thatArray: Array<Int>.SubSequence?
    
    for _ in 0..<nums.count {
        for _ in 0..<nums.count-newLength {
            let sum = nums[startIndex...(startIndex+newLength)].reduce(0, +)
            
            if sum > max {
                thatArray = nums[startIndex...(startIndex+newLength)]
                max = sum
            }
            startIndex += 1
        }
        startIndex = 0
        newLength -= 1
    }
    print(thatArray!)
    return max
}

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


