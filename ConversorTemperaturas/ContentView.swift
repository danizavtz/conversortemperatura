//
//  ContentView.swift
//  ConversorTemperaturas
//
//  Created by Daniel  Pires on 13/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var valor = 0.0
    @State private var tempOptions = ["Kelvin", "Farenheith"]
    @State private var tempSelection = "Kelvin"
    @FocusState var amountIsFocused: Bool
    var convertedTemp: Double {
        let temp = Double(valor)
        if (tempSelection == "Kelvin") {
            return temp + 273.15
        }
        return (temp * 9/5 ) + 32;
    }
    
    var unidadeMedida: String {
        if tempSelection == "Kelvin" { return "ºK" }
        return "ºF"
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Temperatura em Celsius", value: $valor, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        
                }
                Section {
                    Text("Converter para...")
                    Picker("Tip percentage", selection: $tempSelection) {
                            ForEach(tempOptions, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                }
                Section {
                    Text("Temperatura convertida é: \(String(format: "%.2f", convertedTemp)) \(unidadeMedida)")
                }
            }
            .navigationTitle("Temperaturas")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
