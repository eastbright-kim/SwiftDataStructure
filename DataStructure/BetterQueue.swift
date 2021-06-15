//
//  main.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/14.
//

import Foundation
// deque할 때마다 배열을 앞으로 옮기는 건 비효율적이기 때문에, deque된 자리를 nil로 놓고, head로 자료가 nil이 아닌 곳을 가르킴. 그리고 nil인 자리가 많아지면 그 때 한꺼번에 nil자리를 arr.removeFirst(head)로 없애고 head를 다시 0으로 만듦
public struct BetterQueue<T> {
    
    
    private var array: [T?] = []
    private var head = 0
    
    public var isEmpty: Bool {
        //nil이 들어있으면 isEmpty가 false로 나옴, 실제로 배열에 nil도 없어야 비어있는 것임
        return array.count == 0
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T){
        array.append(element)
    }
    
    public mutating func dequeue() -> T?{
        
        guard head < self.count , let element = self.array[head] else {return nil}
        
        array[head] = nil
        head += 1
        
        // 배열의 크기가 크고, 빈 자리가 25퍼센트 이상이 될 때 초기화 시킴
        let percentage = Double(self.head) / Double(self.count)
        if self.count > 50 && percentage > 0.25 {
            self.array.removeFirst(head)
            self.head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}
