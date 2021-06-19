//
//  Tree.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/19.
//

import Foundation

public class TreeNode<T> {
    
    public var value: T
    //메모리 누수 방지. parent가 없어졌는데도, 자식 노드에서 참조 중일 수가 있음
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


//tree의 높이 - 루트와 가장 낮은 leaf의 링크 수
//node의 깊이 - 해당 노드와 루트노트의 링크 수


extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode?{
        if self.value == value {
            return self
        }
        
        //칠드런을 계속 타고 들어가서 있으면 리턴함
        for child in children {
            if let found = search(child.value) {
                return found
            }
        }
        return nil
    }
}
