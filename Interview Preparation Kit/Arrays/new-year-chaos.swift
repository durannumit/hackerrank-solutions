import Foundation

// Complete the minimumBribes function below.
func minimumBribes(q: [Int]) -> Void {
    var ans = 0
    var shouldShow = true
    for i in stride(from: (q.count - 1), through: 0, by: -1) {

        if (q[i] - (i+1) > 2) {
           shouldShow = false
           break;
        }

        for j in  stride(from: max(0, q[i] - 2), to: i, by: 1){
            if q[j] > q[i] {
                ans += 1
            }
        }
    }

    if shouldShow {
        print(ans)
    } else {
        print("Too chaotic")
    }

}

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let qTemp = readLine() else { fatalError("Bad input") }
    let q: [Int] = qTemp.split(separator: " ").map {
        if let qItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return qItem
        } else { fatalError("Bad input") }
    }

    guard q.count == n else { fatalError("Bad input") }

    minimumBribes(q: q)
}
