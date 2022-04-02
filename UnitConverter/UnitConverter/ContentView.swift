//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dawid Kubicki on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var chosenUnit = "Temperature"
    let units = ["Temperature", "Length", "Time", "Volume"]
    
    private var myItems: [String] {
        let myUnit = chosenUnit
        var itemArray = [String]()
        
        if myUnit == "Temperature" {
            itemArray.append(myUnit)
        }
        
        return itemArray
        
    }
    
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
                
                Section {
                    ForEach(myItems, id: \.self) {
                        Text($0)
                    }
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
