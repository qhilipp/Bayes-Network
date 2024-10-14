//
//  ContentView.swift
//  Bayes Network
//
//  Created by Philipp Kathöfer on 10/11/24.
//

import SwiftUI

struct ContentView: View {
	
	let network: BayesNetwork
	let rain, wetGrass, worms: BayesNetworkNode
	
	init() {
		rain = BayesNetworkNode(name: "Rain")
		wetGrass = BayesNetworkNode(name: "Wet Grass")
		worms = BayesNetworkNode(name: "Worms")
		
		network = BayesNetwork()
		network.quantify(rain, with: [[nil: .boolean(value: true)]: 0.2, [nil: .boolean(value: false)]: 0.8])
		network.quantify(wetGrass, with: [[rain: .boolean(value: true)]: 0.85, [rain: .boolean(value: false)]: 0.15])
		network.quantify(worms, with: [[wetGrass: .boolean(value: true)]: 0.9, [wetGrass: .boolean(value: false)]: 0.1])
	}
	
    var body: some View {
        VStack {
			Text("Das ist ein langer Title, damit das Fenster groß genug ist :)")
			Text("\(network.edges.count)")
			HStack {
				ForEach(network.nodes.sorted { $0.name < $1.name }, id: \.self.name) { node in
					Text(node.name)
				}
			}
			VStack(alignment: .leading) {
				ForEach(Array(network.edges.keys), id: \.self.name) { parent in
					Text(parent.name).bold()
					ForEach(network.edges[parent]?.sorted { $0.name < $1.name } ?? [], id: \.self.name) { child in
						Text("- \(child.name)")
							.padding(.leading, 10)
					}
				}
			}
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
