import Cocoa
//
// https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
// Example 1:
//
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
// Example 2:
//
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
// Example 3:
//
// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

class Solution {

    func checkStringForRepeatingCharacters(_ inputString: String) -> Bool {
        var outputArray: [Character] = []
        for ch: Character in inputString {
            if outputArray.contains(ch) == true {
                return true
            }
            outputArray.append(ch)
        }
        return false
    }

    func findLongestSubstringWithNoRepeatingCharacters(_ inputString: String) -> String {
        guard inputString.count > 1 else { return inputString }
        var outString: String = ""
        var endAt: Int = 1
        while true {
            let subString = String(inputString[inputString.index(inputString.startIndex, offsetBy: 0)...inputString.index(inputString.startIndex, offsetBy: endAt)])
            if checkStringForRepeatingCharacters(subString) {
                break
            }
            outString = subString
            endAt += 1
            if endAt == inputString.count {
                break
            }
        }
        return outString
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        return 0
    }
}

let ipString: String = "abcabcbb"
//let inputString: String = "bbbbb"
//let inputString: String = "pwwkew"
//let inputString: String = "aaaaaaaaaaaaaaaaaaabkew"
var finalString: String = ""
var testString: String = ipString
var opString: String = ""

var startAt: Int = 0

var solution: Solution = Solution()

while true {
    let opString = solution.findLongestSubstringWithNoRepeatingCharacters(testString)
    // replace the current longest substring if the new one is longer
    if opString.count > finalString.count {
        finalString = opString
    }
    startAt += 1
    // if we have a shorter substring left than the current longest string, we're done
    if ((ipString.count - startAt) < finalString.count) || (ipString.count == startAt) {
        break
    }
    testString = String(ipString[ipString.index(ipString.startIndex, offsetBy: startAt)...ipString.index(ipString.startIndex, offsetBy: ipString.count - 1)])
}
print("Longest substring found: \(finalString) is \(finalString.count) in length")
