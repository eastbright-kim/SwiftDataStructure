//
//  BinarySearch.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/16.
//

import Foundation

func binarySearch<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int?{
    
    if range.lowerBound >= range.upperBound {
        //끝까지 찾았는데 없다
        return nil
    } else {
        let middleIndex = (range.lowerBound + range.upperBound) / 2
        if array[middleIndex] > key {
            return binarySearch(array, key: key, range: range.lowerBound..<middleIndex)
        } else if array[middleIndex] < key {
            return binarySearch(array, key: key, range: middleIndex..<range.upperBound)
        }else{
            //array[middleIndex] == key
            return middleIndex
        }
    }
}

//재귀말고 반복문으로 찾기
func binarySearch<T: Comparable>(_ array: [T], key: T) -> Int? {
    
    var lowerBound = 0
    var upperBound = array.count
    while lowerBound < upperBound {
        let midIndex = (lowerBound + upperBound) / 2
        if array[midIndex] == key {
            return midIndex
        } else if array[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}
