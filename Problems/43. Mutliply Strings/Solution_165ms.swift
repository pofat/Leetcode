/* Time complexity: O(mn), Space: O(m+n)
 * Execution time: 165ms
 * Ideas:
 *   1. Handle edge cases
 *   2. Convert num1 and num2 into [Int]
 *   3. Declare a result [Int] of length of num1.count + num2.count
 *   4. Mutliply num2 with each digit of num1 and accumulate on cooresponding index in result [Int]
 *   5. Remove leading zeros and convert back into String with joined()
 */

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "" && num2 != "" else {
            return ""
        }
        
        guard num1 != "0" && num2 != "0" else {
            return "0"
        }
        
        let num1Array = num1.characters.reversed().flatMap { Int(String($0)) }
        let num2Array = num2.characters.reversed().flatMap { Int(String($0)) }
        
        let m = num1Array.count
        let n = num2Array.count
        
        var result = Array(repeating: 0, count: m + n)
        
        var carry = 0
        for (index1, number1) in num1Array.enumerated() {
            
            for (index2, number2) in num2Array.enumerated() {
                let currentIndex = m + n - index1 - index2 - 1
                let accumulatedElement = result[currentIndex] + number1 * number2 + carry
                carry = accumulatedElement/10
                result[currentIndex] = accumulatedElement % 10
            }
            
            if carry != 0 {
                result[m - index1 - 1] = carry
                carry = 0
            }
        }
        
        var answer: [Int] = []
        var encounterFirstNonZero = false
        for e in result {
            if encounterFirstNonZero {
                answer.append(e)
            } else if e != 0 {
                encounterFirstNonZero = true
                answer.append(e)
            }
        }
        
        return answer.flatMap { String($0) }.joined()

    }
}
