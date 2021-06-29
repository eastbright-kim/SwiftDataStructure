//
//  Deque.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/29.
//

import Foundation

public class Deque<T> {
    
    private var arr = [T]()
    
    public var isEmpty: Bool {
        return arr.isEmpty
    }
    
    public var count: Int {
        return arr.count
    }
    
    public func enqueue(_ element: T){
        arr.append(element)
    }
    
    //inefficient O(n)
    public func enqueueFront(_ element: T){
        arr.insert(element, at: 0)
    }
    
    //inefficient O(n) 요소들 자리 이동의 문제
    public func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return arr.removeFirst()
        }
    }
    
    //arr의 충분한 공간을 뒤에다 남겨둬서 비효율 발생하지 않음
    public func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return arr.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        return arr.first
    }
    
    public func peekBack() -> T? {
        return arr.last
    }
    
}
