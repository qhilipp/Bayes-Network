//
//  BayesNetworkNode.swift
//  Bayes Network
//
//  Created by Philipp Kathöfer on 10/11/24.
//

import Foundation

struct Point: Hashable {
	var x: Float
	var y: Float
}

class BayesNetworkNode: Equatable, Hashable {
	var name: String
	var position: Point
	var parents: [BayesNetworkNode] = []
	var probabilities: [[BayesNetworkNode?: NodeValue]: Float] = [:]
	
	init(name: String, position: Point = Point(x: 0, y: 0)) {
		self.name = name
		self.position = position
	}
	
	func probability(given values: [BayesNetworkNode: NodeValue]) -> Float {
		probabilities[values.filter { parents.contains($0.key) }] ?? -1
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(position)
	}
	
	static func ==(lhs: BayesNetworkNode, rhs: BayesNetworkNode) -> Bool {
		lhs.name == rhs.name && lhs.position == rhs.position
	}
}
