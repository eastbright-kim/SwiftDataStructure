//
//  LinkedList.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/29.
//

import Foundation

public class LinkedListNode<T> {
    
    var value: T
    var next: LinkedListNode?
    var previous: LinkedListNode?
    
    public init(value: T){
        self.value = value
    }
}


public class LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        
        guard var node = head else {return nil}
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    public func append(_ value: T){
        
        let newNode = LinkedListNode(value: value)
        
        if let last = last {
            last.next = newNode
            newNode.previous = last
        } else {
            head = newNode
        }
    }
    
    public var count: Int {
        
        guard var node = head else {return 0}
        var count = 1
        
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    public func node(at index: Int) -> Node{
        
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    public func insert(node: Node, at index: Int){
        
        let newNode = node
        if index == 0 {
            head?.previous = newNode
            newNode.next = head
            head = newNode
        } else {
            
            let prev = self.node(at: index-1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    public func removeAll(){
        head = nil
    }
}

