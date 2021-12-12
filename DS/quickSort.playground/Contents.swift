func partition(list: inout [Int], startIndex: Int, endIndex: Int) -> Int {
    let pivot = list[endIndex]
    var pIndex = startIndex
    
    for i in startIndex..<endIndex {
        if list[i] <= pivot {
            list.swapAt(i, pIndex)
            pIndex+=1
        }
    }
    list.swapAt(pIndex, endIndex)
    return pIndex
}

func quickSort(list: inout [Int], startIndex: Int, endIndex: Int) {
    guard startIndex < endIndex else { return }
    let pIndex = partition(list: &list, startIndex: startIndex, endIndex: endIndex)
    quickSort(list: &list, startIndex: startIndex, endIndex: pIndex-1)
    quickSort(list: &list, startIndex: pIndex+1, endIndex: endIndex)
    
}

var list = [3,1,2,8,7,5,6,4]
quickSort(list: &list, startIndex: 0, endIndex: list.count-1)
print(list)
