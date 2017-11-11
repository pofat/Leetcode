// Time: O(n), Space: O(n)
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for i in 0 ..< nums.count {
            dict[target - nums[i]] = i
        }
        
        var idx1 = 0
        var idx2 = 0
        for i in 0 ..< nums.count {
            if let result = dict[nums[i]], result != i {
                idx1 = i
                idx2 = result
                
            }
        }
        
        return idx1 > idx2 ? [idx2, idx1] : [idx1, idx2]
    }
}
