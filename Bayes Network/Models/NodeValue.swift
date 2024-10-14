//
//  NodeValue.swift
//  Bayes Network
//
//  Created by Philipp Kathöfer on 10/11/24.
//

import Foundation

enum NodeValue: Hashable {
	case boolean(value: Bool)
	case integer(value: Int)
	case string(value: String)
}
