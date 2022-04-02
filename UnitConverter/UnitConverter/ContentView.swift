//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dawid Kubicki on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var chosenUnit: String = "Temperature"
    let units = ["Temperature", "Length", "Time", "Volume"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Units", selection: $chosenUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Choose units")
                }
            }
            .navigationTitle("UnitConverter")
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
