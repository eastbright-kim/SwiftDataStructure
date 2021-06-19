//
//  Tree.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/19.
//

import Foundation

public class TreeNode<T> {
    
    public var value: T
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChildren(_ node: TreeNode<T>){
        self.children.append(node)
        node.parent = self
    }
    
}
