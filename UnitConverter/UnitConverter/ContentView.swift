//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dawid Kubicki on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var amountIsFocused: Bool
    
    @State private var chosenUnit = "Temperature"
    let units = ["Temperature", "Length", "Time", "Volume"]
    
    let lengthUnits = ["m", "km", "feet", "yard", "miles"]
    
    @State private var lengthUnitInput = "meters"
    @State private var lengthUnitOutput = "meters"
    
    @State private var inputValue = 0.0
    
    private var myType: FloatingPointFormatStyle<Double> {
        return .number
    }
    
    func converter(unit: String, from: String, to: String, _ input: Double) -> Double {
        
        var baseValue = 0.0
        var output = 0.0
        
        if unit == "Length" {
            
            // Convert everything to meters
            
            if from == "m" {
                baseValue = input
            } else if from == "km" {
                baseValue = input * 1000
            } else if from == "feet" {
                baseValue = input * 1000
            } else if from == "yard" {
                baseValue = input * 1000
            } else if from == "miles" {
                baseValue = input * 1000
            }
            
            // Return converting from meters
            
            if to == "m" {
                output = baseValue
            } else if to == "km" {
                output = baseValue * 1000
            } else if to == "feet" {
                output = baseValue * 1000
            } else if to == "yard" {
                output = baseValue * 1000
            } else if to == "miles" {
                output = baseValue * 1000
            }
            
        }
        
        return output
    
    }
    
    private var finalResult: Double {
        switch chosenUnit {
        case "Temperature":
            return 0.0
        case "Length":
            return converter(unit: chosenUnit, from: lengthUnitInput, to: lengthUnitOutput, inputValue)
        case "Time":
            return 0.0
        case "Volume":
            return 0.0
        default:
            return 0.0
        }
        
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
                        
                        Section {
                            TextField("Amount", value: $inputValue, format: myType)
                                                    .keyboardType(.decimalPad)
                                                    .focused($amountIsFocused)
                        } header: {
                            Text("Number to convert")
                        }
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
                
                Section {
                    Text("\(finalResult)")
                } header: {
                    Text("Result")
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
