// You can use brutal force to do with O(n^3) (Given top left is 1, find maximu rectangle, which takes O(n), do with each position, thus become O(n^3) )
// Use DP, we iterate all columns, and record each column's (of all row) maximum left and minimum right and multipy  
// So we iterate all columns and do as description above
// * The reason right starts from n , not n -1 , because we calculate area by (right - left + 1) * height.
// So we just shift right one unit to become right + 1.
// The complexity of using DP is O(mn)
class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else {
            return 0
        }
        
        let rows = matrix.count
        let columns = matrix[0].count
        
        var left = Array(repeating: 0, count: columns)
        // Note that right is inited by maximal number(columns)
        var right = Array(repeating: columns, count: columns)
        var height = Array(repeating: 0, count: columns)
        var maxArea = 0
        
        for i in 0 ..< rows {
            var currentLeft = 0
            var currentRight = columns
            for j in 0 ..< columns {
                if matrix[i][j] == "1" {
                    left[j] = max(left[j], currentLeft)
                    height[j] += 1
                } else {
                    
                    left[j] = 0
                    currentLeft = j + 1
                    height[j] = 0
                }
            }
            // Ends at -1, not zere. Otherwise stride will stop at 1 not zero.
            // Must be aware of this.
            for j in stride(from: columns - 1, to: -1, by: -1) {
                if matrix[i][j] == "1" {
                    right[j] = min(currentRight, right[j])
                } else {
                    currentRight = j
                    right[j] = columns
                }
            }
            // Must calculate this for each row. In case there's a row of zero, which will elimniate above history
            for j in 0 ..< columns {
                let area = (right[j] - left[j]) * height[j]
                if area > maxArea {
                    maxArea = area
                }
            }
        }
        
        return maxArea
        
    }
}
