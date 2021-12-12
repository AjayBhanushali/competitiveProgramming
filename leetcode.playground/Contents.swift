//https://leetcode.com/problems/container-with-most-water/
func maxAreaa(_ height: [Int]) -> Int {
    var width = height.count-1
    var maxArea = 0
    
    var short = 0
    var temp = 0
    for _ in 0..<height.count-1 {
        for j in 0..<height.count-width {
            temp += 1
//            print(temp)
            let newLeftIndex = j
            let newRightIndex = j + width
            let newShort = height[newLeftIndex] > height[newRightIndex] ? height[newRightIndex] : height[newLeftIndex]
//            print(">>>")
            print("\(height[newLeftIndex]) & \(height[newRightIndex])")
            if newShort > short {
                short = newShort
                let newMaxArea = width * newShort
//                print("+++")
//                print("\(height[newLeftIndex]) & \(height[newRightIndex]) = \(newMaxArea)")
                if newMaxArea > maxArea {
                    maxArea = newMaxArea
                }
            }
        }
        width -= 1
    }
    
    return maxArea
}
func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var leftIndex = 0
        var rightIndex = height.count - 1
        
        while leftIndex < rightIndex {
           if height[leftIndex] < height[rightIndex]{
                maxArea = max(maxArea, height[leftIndex] * (rightIndex - leftIndex))
                leftIndex += 1
            } else {
                maxArea = max(maxArea, height[rightIndex] * (rightIndex - leftIndex))
                rightIndex -= 1
            }
        }
        
        return maxArea
    }
maxArea([1,2,4,3])
maxArea([1,8,6,2,5,4,8,3,7])
maxArea([1,1])
maxArea([1,2,1])
maxArea([3,9,3,4,7,2,12,6])

func moveZeroes(_ nums: inout [Int]) {
    var preIndex = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, preIndex)
                preIndex += 1
            }
        }
}
var nnnumss = [0]
var nnnums = [1,0]
var nnums = [0,0,0,1,3,0,12,0,4,50,0]
var nums = [1,2,3,1]
moveZeroes(&nums)
moveZeroes(&nnums)
moveZeroes(&nnnums)
moveZeroes(&nnnumss)

func moveZeroesOld(_ nums: inout [Int]) {
    for i in 0..<nums.count-1 {
        if nums[i] == 0 && nums[i+1] != 0 {
            nums.swapAt(i, i+1)
        } else if nums[i] == 0 && nums[i+1] == 0 {
            if i+2 < nums.count {
                nums.swapAt(i, i+2)
            }
        }
        print(nums)
    }
}


//https://leetcode.com/problems/majority-element/
func majorityElement(_ nums: [Int]) -> Int {
    let maxCount = nums.count/2
    var counts: [Int: Int] = [:]
    for num in nums {
        counts[num] = (counts[num] ?? 0) + 1
        if counts[num]! > maxCount {
            return num
        }
    }
    return 0
}

majorityElement([2,3,3])
majorityElement([2,3,3,4,4,7,7,7,4,4,4,4,4,4])


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


