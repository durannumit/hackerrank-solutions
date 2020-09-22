import Foundation

// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {

    var sum = -1000

    for row in 0...3 {

        for column in 0...3 {
            var top = arr[row][column] + arr[row][column + 1] + arr[row][column + 2]
            var middle = arr[row + 1][column + 1]
            var bottom = arr[row + 2][column] + arr[row + 2][column + 1] + arr[row + 2][column + 2]

            if(top + middle + bottom > sum){
                sum = top + middle + bottom
            }
     }
    }
    return sum
}
let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

let arr: [[Int]] = AnyIterator{ readLine() }.prefix(6).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    return arrRow
}

guard arr.count == 6 else { fatalError("Bad input") }

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
