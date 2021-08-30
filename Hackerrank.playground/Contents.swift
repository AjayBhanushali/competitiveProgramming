var arr: [[Int]] = [[Int]](repeating: [], count: 5)

func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    // Write your code here
    var answers: [Int] = []
    var dictionary:[Int:[Int]] = [:]
    var lastAnswer = 0
    
    for query in queries {
        let queryType = query[0]
        let x = query[1]
        let y = query[2]
        
        let idx = (x^lastAnswer) % n
        switch queryType {
        case 1:
            if var value = dictionary[idx] {
                value.append(y)
                dictionary[idx] = value
            } else {
                dictionary[idx] = [y]
            }
        case 2:
            if let value = dictionary[idx] {
                let idy = (y % value.count)
                if let newValue = dictionary[idx] {
                    lastAnswer = newValue[idy]
                    answers.append(lastAnswer)
                }
                
            }
        default: continue
        }
    }
    
    return answers
}

func rotateLeft(d: Int, arr: [Int]) -> [Int] {
  var myArray = arr
  let size = myArray.count - 1
  for i in 0...size {
    let newloc = (i + (myArray.count - d)) % myArray.count
    myArray[newloc] = arr[i]
  }
  return myArray
}

