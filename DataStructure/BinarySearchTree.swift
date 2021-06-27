//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/20.
//

import Foundation

enum BinaryTree<T: Comparable> {
    case empty
    
    //메모리에 값 타입 인스턴스 올릴 때, 정확히 얼마가 될 지 알아야하는데, 재귀가 생기면 크기가 얼마나 될 지 알 수 없어서 오류가 생김, indirect 써주면 reference가 올라가서 크기를 알 수 있어서 오류 해결
    indirect case node(BinaryTree, T, BinaryTree)
    
    mutating func naiveInsert(newValue: T){
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
        
    }
}


public class BinarySearchTree<T: Comparable> {
    
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T){
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return left != nil || right != nil
    }
    
    public var hasBothChildren: Bool {
        return left != nil && right != nil
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    
    public func insert(value: T) {
        
        if value < self.value {
            
            if let left = left {
                left.insert(value: value)
            } else {
                let left = BinarySearchTree(value: value)
                self.left = left
            }
        } else {
            
            if let right = right {
                right.insert(value: value)
            } else {
                let right = BinarySearchTree(value: value)
                self.right = right
            }
        }
    }
    
    public func search(value: T) -> BinarySearchTree?{
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self
        }
    }
    
    public func iterativeSearch(value: T) -> BinarySearchTree? {
        
        var node: BinarySearchTree? = self
        
        while let n = node {
            if value < n.value {
                node = left
            } else if value > n.value {
                node = right
            } else {
                return node
            }
        }
        return nil
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
    public func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
            node?.parent = parent
        }
    }
    
    public func minimum() -> BinarySearchTree {
        
        var node = self
        while let n = node.left {
            node = n.minimum()
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        
        var node = self
        while let n = node.right {
            node = n.maximum()
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree? {
        
        var replacement: BinarySearchTree?
        
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        replacement?.right = right
        replacement?.left = left
        replacement?.reconnectParentTo(node: replacement)
        right?.parent = self
        left?.parent = self
        
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        
        var s = ""
        
        if let left = left {
            s += "(\(left.description)) <- "
        }
        
        s += "\(value)"
        
        if let right = right {
            s += "\(right.description)"
        }
        
        return s
    }
}
