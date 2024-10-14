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
		
		rain.probabilities[[:]] = 0.2
		rain.probabilities[[:]] = 0.8
		
		wetGrass.probabilities[[rain: .boolean(value: true)]] = 0.85
		wetGrass.probabilities[[rain: .boolean(value: false)]] = 0.15
		
		worms.probabilities[[wetGrass: .boolean(value: true)]] = 0.9
		worms.probabilities[[wetGrass: .boolean(value: false)]] = 0.1
				
		network = BayesNetwork()
		network.connect(rain, with: wetGrass)
		network.connect(wetGrass, with: worms)
//		network.connect(worms, with: worms)
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
