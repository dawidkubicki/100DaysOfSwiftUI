//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dawid Kubicki on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0.0
    @FocusState private var amountIsFocused: Bool
    
    @State private var chosenUnit = "Temperature"
    let units = ["Temperature", "Length", "Time", "Volume"]
    
    @State private var lengthUnitInput = "meters"
    let lengthUnits = ["m", "km", "feet", "yard", "miles"]
    @State private var lengthUnitOutput = "meters"
    
    private var myType: FloatingPointFormatStyle<Double> {
        return .number
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
                    if chosenUnit == "Temperature" {
                        Text("Temperature")
                    } else if chosenUnit == "Length" {
                        Section {
                            Picker("Input", selection: $lengthUnitInput) {
                                ForEach(lengthUnits, id: \.self) {
                                    Text($0)
                                }
                            }.pickerStyle(.segmented)
                        } header: {
                            Text("Input units")
                        }
                        
                        Section {
                            Picker("Output", selection: $lengthUnitOutput) {
                                ForEach(lengthUnits, id: \.self) {
                                    Text($0)
                                }
                            }.pickerStyle(.segmented)
                        } header: {
                            Text("Output units")
                        }
                        
                        TextField("Amount", value: $inputValue, format: myType)
                                                .keyboardType(.decimalPad)
                                                .focused($amountIsFocused)
                        
                    } else if chosenUnit == "Time" {
                        Text("Time")
                    } else if chosenUnit == "Volume" {
                        Text("Volume")
                    } else {
                        Text("Temperature")
                    }
                } header: {
                    Text("Attributes")
                }
            }
            .navigationTitle("UnitConverter")
            .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                
                                Button("Done") {
                                    amountIsFocused = false
                                }
                            }
                        }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
