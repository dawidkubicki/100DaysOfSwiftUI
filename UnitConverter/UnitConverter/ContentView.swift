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
    
    var listChosenUnits: [String] {
        if chosenUnit == "Temperature" {
            return ["celcius", "fahrenheit", "kelvin"]
        } else if chosenUnit == "Length" {
            return ["m", "km", "feet", "yard", "miles"]
        } else if chosenUnit == "Time" {
            return ["seconds", "minutes", "hours", "days"]
        } else if chosenUnit == "Volume" {
            return ["milliliters", "liters", "cups", "pints", "gallons"]
        }
        
        return ["celcius", "fahrenheit", "kelvin"]
    }
    
    @State private var unitInput = "meters"
    @State private var unitOutput = "meters"
    
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
                baseValue = input * 0.3048
            } else if from == "yard" {
                baseValue = input * 0.9144
            } else if from == "miles" {
                baseValue = input * 1609.344
            }
            
            // Return converting from meters
            
            if to == "m" {
                output = baseValue
            } else if to == "km" {
                output = baseValue * 1000
            } else if to == "feet" {
                output = baseValue * 3.2808399
            } else if to == "yard" {
                output = baseValue * 1.0936133
            } else if to == "miles" {
                output = baseValue * 0.000621371192
            }
            
        } else if unit == "Temperature" {
            
            // Convert all to celcius
            if from == "celcius" {
                baseValue = input
            } else if from == "fahrenheit" {
                baseValue = input + (-17.2222222)
            } else if from == "kelvin" {
                baseValue = input + (-272.15)
            }
            // Convert all from celcius
            if to == "celcius" {
                output = baseValue
            } else if to == "fahrenheit" {
                output = baseValue + 33.8
            } else if to == "kelvin" {
                output = baseValue + 274.15
            }
            
        } else if unit == "Time" {
            
            // Convert all to seconds
            if from == "seconds" {
                baseValue = input
            } else if from == "minutes" {
                baseValue = input * 60
            } else if from == "hours" {
                baseValue = input * 3600
            } else if from == "days" {
                baseValue = input * 3600 * 24
            }
            
            // Convert all from seconds
            if to == "seconds" {
                output = baseValue
            } else if to == "minutes" {
                output = baseValue / 60
            } else if to == "hours" {
                output = baseValue / 3600
            } else if to == "days" {
                output = baseValue / (3600*24)
            }
        } else if unit == "Volume" {
            
            // Convert all to milliliters
            if from == "milliliters" {
                baseValue = input
            } else if from == "liters" {
                baseValue = input * 0.001
            } else if from == "cups" {
                baseValue = input * 0.00422675284
            } else if from == "pints" {
                baseValue = input * 0.00211337642
            } else if from == "gallons" {
                baseValue = input * 0.000264172052
            }
            
            // Convert all from milliliters
            if to == "milliliters" {
                output = baseValue
            } else if to == "liters" {
                output = output / 0.001
            } else if to == "cups" {
                output = output / 0.00422675284
            } else if to == "pints" {
                output = output / 0.00211337642
            } else if to == "gallons" {
                output = output / 0.000264172052
            }
            
        }
        
        return output
    
    }
    
    var finalResult: Double {
        return converter(unit: chosenUnit, from: unitInput, to: unitOutput, inputValue)
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
                    
                    Section {
                        Picker("Input", selection: $unitInput) {
                            ForEach(listChosenUnits, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("Input units")
                    }
                    
                    Section {
                        Picker("Output", selection: $unitOutput) {
                            ForEach(listChosenUnits, id: \.self) {
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
                
                } header: {
                    Text("Attributes")
                }
                
                Section {
                    Text("\(finalResult.formatted())")
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
