//
//  Heap.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/30.
//

import Foundation

// A heap is a binary tree inside an array, so it does not use parent/child pointers. A heap is sorted based on the "heap property" that determines the order of the nodes in the tree. You can not start a new level unless the current lowest level is completely full

//There are two kinds of heaps: a max-heap and a min-heap which are different by the order in which they store the tree nodes.


//parent(i) = floor((i - 1)/2)
//left(i)   = 2i + 1
//right(i)  = 2i + 2


//Insert - The first step when inserting a new item is to append it to the end of the array
//To restore the heap property, we swap.
//The time required for shifting up is proportional to the height of the tree, so it takes O(log n) time

//remove - empty spot at the top. we take the last object we have, stick it up on top of the tree, and restore the heap property.

// removing an element could potentially invalidate the max-heap or min-heap property. To fix this, we swap the node that we are removing with the last element:
