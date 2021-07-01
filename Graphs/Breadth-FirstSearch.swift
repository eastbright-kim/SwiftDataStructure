//
//  Breadth-FirstSearch.swift
//  DataStructure
//
//  Created by 김동환 on 2021/06/30.
//

import Foundation

func breadthFirstSearch(_ graph: Graph, source: Node) -> [String] {
    
    var queue = BetterQueue<Node>()
    queue.enqueue(source)
    
    var nodesExplored = [source.label]
    source.visited = true
    
    while let node = queue.dequeue() {
        for edge in node.neighbors {
            let neighborNode = edge.neighbor
            if !neighborNode.visited {
                neighborNode.visited = true
                nodesExplored.append(neighborNode.label)
            }
        }
    }
    return nodesExplored
}
