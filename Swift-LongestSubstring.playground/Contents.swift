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
        guard inputString.count > 1 else {
            return inputString
        }
        var outString: String = ""
        let startAt: Int = 0
        var endAt: Int = startAt + 1

        let startPosn = inputString.index(inputString.startIndex, offsetBy: startAt)

        while true {
            let endPosn = inputString.index(inputString.startIndex, offsetBy: endAt)
            let subString = inputString[startPosn...endPosn]
            if checkStringForRepeatingCharacters(String(subString)) {
                break
            }
            outString = String(subString)
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

let inputString: String = "abcabcbb"
//let inputString: String = "bbbbb"
//let inputString: String = "pwwkew"
//let inputString: String = "aaaaaaaaaaaaaaaaaaabkew"
var finalString: String = ""
var testString: String = inputString
var outString: String = ""

var startAt: Int = 0
let endAt: Int = inputString.count

var solution: Solution = Solution()

while true {
    let outString = solution.findLongestSubstringWithNoRepeatingCharacters(testString)
    // replace the current longest substring if the new one is longer
    if outString.count > finalString.count {
        finalString = outString
    }
    startAt += 1
    // if we have a shorter substring left than the current longest string, we're done
    if ((endAt - startAt) < finalString.count) || (endAt == startAt) {
        break
    }
    let startPosn = inputString.index(inputString.startIndex, offsetBy: startAt)
    let endPosn = inputString.index(inputString.startIndex, offsetBy: endAt - 1)
    testString = String(inputString[startPosn...endPosn])
}
print("Longest substring found: \(finalString)")
print("Characters in length: \(finalString.count)")
