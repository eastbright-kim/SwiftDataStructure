//
//  InsertionSort.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/14.
//

import Foundation

public struct InsertionSort {
    
    static func insertionSort(_ array: [Int]) -> [Int] {
        // | 을 점점 오른쪽으로 이동하면서 왼쪽에 있는 숫자들 정렬시키고 점점 오른쪽으로 | 이동하면서 전체 배열 정렬
        var sortedArr = array
        
        for index in 1...sortedArr.count-1 {
            var currentIndex = index
            
            while currentIndex > 0 && sortedArr[currentIndex] < sortedArr[currentIndex - 1] {
                sortedArr.swapAt(currentIndex, currentIndex - 1)
                currentIndex -= 1
            }
            
        }
        return sortedArr
    }
    
    static func fastInsertionSort(_ array: [Int]) -> [Int] {
        //swapAt을 거치지 않고, temp에 값을 받아 놓은 다음 인접한 값을 비교해서 temp를 삽입할 자리를 찾는다
        var sortedArr = array
        for index in 1...sortedArr.count {
            var currentIndex = index
            let temp = sortedArr[currentIndex]
            while currentIndex > 0, temp < sortedArr[currentIndex - 1]{
                sortedArr[currentIndex] = sortedArr[currentIndex - 1]
                currentIndex -= 1
            }
            sortedArr[currentIndex] = temp
        }
        return sortedArr
    }
}
