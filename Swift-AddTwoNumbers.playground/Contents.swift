/*
 * Solution to the LeetCode problem - Add Two Numbers (https://leetcode.com/problems/add-two-numbers/)
 *
 * uses recursive code fragments
 */

import Cocoa

/**
 * Definition for singly-linked list.
 */

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {

    func getNumberFromReverseLinkedList(list: ListNode?) -> Int {
        guard let useList = list else {
            return 0
        }
        var result: Int = useList.val
        if let nextList = list!.next {
            result += (10 * getNumberFromReverseLinkedList(list: nextList))
        }
        return result
    }

    func buildLinkedListFromNumber(list: ListNode?, number: Int) -> ListNode? {
        let result = number / 10
        if result > 0 {
            list?.next = buildLinkedListFromNumber(list: ListNode(result % 10), number: result)
        }
        return list
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result: Int = getNumberFromReverseLinkedList(list: l1) + getNumberFromReverseLinkedList(list: l2)
        return buildLinkedListFromNumber(list: ListNode(result % 10), number: result)
    }

}

/**
 * Test data for the reverse linked lists
 */

// testcase 1 - Input: l1 = [2,4,3], l2 = [5,6,4] / Output: [7,0,8]
var l1: ListNode = ListNode(2, ListNode(4, ListNode(3)))
var l2: ListNode = ListNode(5, ListNode(6, ListNode(4)))

// testcase 2 - Input: l1 = [0], l2 = [0] / Output: [0]
//var l1: ListNode = ListNode(0)
//var l2: ListNode = ListNode(0)

// testcase 3 - Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9] / Output: [8,9,9,9,0,0,0,1]
//var l1: ListNode = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
//var l2: ListNode = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))

// testcase 4 - Input: l1 = [0], l2 = [0] / Output: [0]
//var l1: ListNode = ListNode(0)
//var l2: ListNode = ListNode(0, ListNode(1))

// testcase 5 - Input: l1 (Blank) l2 (Blank) / Output: [0]
//var l1: ListNode?
//var l2: ListNode?


var sol: Solution = Solution()
var result: ListNode? = sol.addTwoNumbers(l1, l2)

// just a fancy bit to build the result string to display ie [ 2, 5, 6]
var output: String = ""
while 1 == 1 {
    output += "\(result!.val)"
    result = result!.next
    if result == nil {
        break
    }
    output += ", "
}
print("[ \(output) ]")
