//
//  sortedArray.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/29.
//

import Foundation

public struct sortedArray<T: Comparable> {
    
    public var array: [T] = []
    
    init(array: [T]){
        self.array = array.sorted()
    }
    
    public mutating func insert(_ element: T){
        
        let index = findInsertPoint(element)
        
        self.array.insert(element, at: index)
        
    }
    
    private func findInsertPoint(_ element: T) -> Int{
        for i in 0..<array.count {
            if array[i] >= element {
                return i
            }
        }
        return array.count
    }
    
    private func findInsertPointBinary(_ newElement: T) -> Int {
        
        var startIndex = 0
        var endIndex = self.array.count
        
        while startIndex < endIndex {
            let midIndex = (startIndex + endIndex) / 2
            if self.array[midIndex] == newElement {
                return midIndex
            } else if self.array[midIndex] < newElement {
                startIndex = midIndex + 1
            } else {
                endIndex = midIndex - 1
            }
        }
        return startIndex
    }
}
