//
//  ContentView.swift
//  UnitConversions
//
//  Created by Caroline Chan on 13/10/22.
//

import SwiftUI

struct ContentView: View {
    let scales: [String] = ["Celcius", "Fahrenheit", "Kelvin"]
    
    @State private var initialScale: String = "Celcius"
    @State private var initialValue: Double = 0.0
    @State private var desiredScale: String = "Celcius"
    
    private var conversionResult: Double {
        switch initialScale {
        case "Celcius":
            if desiredScale == "Celcius" {
                return initialValue
            } else if desiredScale == "Fahrenheit" {
                return initialValue * 9 / 5 + 32
            } else {
                return initialValue + 273.15
            }
        case "Fahrenheit":
            if desiredScale == "Celcius" {
                return (initialValue - 32) * 5 / 9
            } else if desiredScale == "Fahrenheit" {
                return initialValue
            } else {
                return (initialValue - 32) * 5 / 9 + 273.15
            }
        case "Kelvin":
            if desiredScale == "Celcius" {
                return initialValue - 273.15
            } else if desiredScale == "Fahrenheit" {
                return (initialValue - 273.15) * 9 / 5 + 32
            } else {
                return initialValue
            }
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Initial Scale", selection: $initialScale) {
                        ForEach(scales, id: \.self){ scale in
                            Text(scale)
                        }
                    }
                    
                    TextField("Enter number", value: $initialValue, format: .number)
                } header: {
                    Text("Initial scale and value")
                }
                
                Section {
                    Picker("Desired Scale", selection: $desiredScale) {
                        ForEach(scales, id: \.self){ scale in
                            Text(scale)
                        }
                    }
                } header: {
                    Text("Desire scale conversion")
                }
                
                Section {
                    Text("\(conversionResult) \(desiredScale)")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                } header: {
                    Text("Conversion Result")
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
