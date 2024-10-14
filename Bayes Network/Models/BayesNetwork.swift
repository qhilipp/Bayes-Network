//
//  BayesNetwork.swift
//  Bayes Network
//
//  Created by Philipp Kathöfer on 10/11/24.
//

import Foundation

class BayesNetwork {
		
	var nodes: Set<BayesNetworkNode> = []
	var edges: [BayesNetworkNode: Set<BayesNetworkNode>] {
		get {
			nodes.reduce([:]) { partialResult, node in
				var updatedTable = partialResult
				node.parents.forEach { parent in
					if updatedTable[parent] == nil {
						updatedTable[parent] = []
					}
					updatedTable[parent]?.insert(node)
				}
				return updatedTable
			}
		}
	}
	
	func probability(for a: [BayesNetworkNode], given b: [BayesNetworkNode]) -> Float {
		0
	}
	
	func jointProbability(for values: [BayesNetworkNode: NodeValue]) -> Float {
		0
	}
	
	func connect(_ parent: BayesNetworkNode, with child: BayesNetworkNode) {
		nodes.insert(parent)
		nodes.insert(child)
		child.parents.append(parent)
	}
}
