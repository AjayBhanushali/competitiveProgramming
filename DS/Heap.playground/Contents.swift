import Foundation

var list = [3,9,2,1,4,5]

func heapify(currentIndex: Int) {
    var largestIndex = currentIndex
    
    let leftChildIndex = 2*currentIndex+1
    if leftChildIndex < list.count {
        let leftChild = list[leftChildIndex]
        if leftChild > list[currentIndex] {
            largestIndex = 2*currentIndex+1
        }
    }
    
    let rightChildIndex = 2*currentIndex+2
    if rightChildIndex < list.count {
        let rightChild = list[rightChildIndex]
        if rightChild > list[largestIndex] {
            largestIndex = 2*currentIndex+2
        }
    }
    print("Largest > \(largestIndex)")
    print("Current > \(currentIndex)")
    if largestIndex != currentIndex {
        list.swapAt(currentIndex, largestIndex)
        heapify(currentIndex: largestIndex)
    } else {
        print(list)
    }
}


let index = (list.count/2)-1
//print(list)
heapify(currentIndex: index)

