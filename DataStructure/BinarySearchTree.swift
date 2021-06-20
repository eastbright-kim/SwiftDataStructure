//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/20.
//

import Foundation

enum BinaryTree<T> {
    case empty
    
    //메모리에 값 타입 인스턴스 올릴 때, 정확히 얼마가 될 지 알아야하는데, 재귀가 생기면 크기가 얼마나 될 지 알 수 없어서 오류가 생김, indirect 써주면 reference가 올라가서 크기를 알 수 있어서 오류 해결
    indirect case node(BinaryTree, T, BinaryTree)
}
