func mergeSort(_ list:[Int]) -> [Int] {
    
    if list.count < 2 {
        return list
    }
    
    var sortedList: [Int] = []
    let middleIndex = list.count/2
    var leftList: [Int] = []
    var rightList: [Int] = []
    for i in 0..<middleIndex {
        leftList.append(list[i])
    }
    
    for i in middleIndex..<list.count {
        rightList.append(list[i])
    }
    
    leftList = mergeSort(leftList)
    rightList = mergeSort(rightList)
    sortedList = merge(leftList: leftList, rightList: rightList)
    return sortedList
}

func merge(leftList: [Int], rightList: [Int]) -> [Int] {
    let nLeft = leftList.count
    let nRight = rightList.count
    
    var iLeft = 0, iRight = 0
    
    var sortedList: [Int] = []
    
    while iLeft < nLeft && iRight < nRight {
        if leftList[iLeft] <= rightList[iRight] {
            sortedList.append(leftList[iLeft])
            iLeft += 1
        } else {
            sortedList.append(rightList[iRight])
            iRight += 1
        }
    }
    
    while iLeft < nLeft {
        sortedList.append(leftList[iLeft])
        iLeft += 1
    }
    
    while iRight < nRight {
        sortedList.append(rightList[iRight])
        iRight += 1
    }
    
    return sortedList
}

print(mergeSort([1]))
