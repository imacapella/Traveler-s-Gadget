//
//  ContentView.swift
//  Traveler's Gadget
//
//  Created by Gürkan Karadaş on 11.02.2023.
//

import SwiftUI

struct ContentView: View {
    let units = ["Fahrenheit", "Celcius", "Kelvin"]
    @State var textFieldInput = ""
    @State var textFieldInputCalculated = ""
    @State var temperatureUnit = ""
    @State var temperatureUnitTo = ""
    var body: some View {
        NavigationView {
            Form{
                Section {
                    VStack {
                        TextField("Value", text: $textFieldInput)
                            .keyboardType(.decimalPad)
                            .font(Font.system(size: 30))
                            .multilineTextAlignment(.center)
                        Divider()
                        Picker("Temperature Unit", selection: $temperatureUnit){
                            ForEach(units, id: \.self){Text($0)}
                        }.pickerStyle(.segmented)
                    }
                }
                Section(header:Text("to")) {
                    Picker("Temperature Unit", selection: $temperatureUnitTo){
                        ForEach(units, id: \.self){Text($0)}
                    }.pickerStyle(.segmented)
                }
                Section(header:Text("Result")) {
                    Text(textFieldInput.isEmpty ? "???" : convertions())
                }
            }
            .navigationTitle("Traveler's Gadget")
            .navigationBarTitleDisplayMode(.large)
        }
    }
        
        // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC  // LOGİC // LOGİC  // LOGİC
        
        func convertions() -> String{
            var returnable = ""
            if let value = Double(textFieldInput){
                let celsiusConvertor = Measurement<UnitTemperature>(value: value, unit: .celsius)
                let fahrenheitConvertor = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
                let kelvinConvertor = Measurement<UnitTemperature>(value: value, unit: .kelvin)
                
                let celsiusToFahrenheit = celsiusConvertor.converted(to: .fahrenheit)
                let celsiusToKelvin = celsiusConvertor.converted(to: .kelvin)
                let celsiusToCelsius = celsiusConvertor.converted(to: .celsius)
                
                let fahrenheitToFahrenheit = fahrenheitConvertor.converted(to: .fahrenheit)
                let fahrenheitToKelvin = fahrenheitConvertor.converted(to: .kelvin)
                let fahrenheitToCelsius = fahrenheitConvertor.converted(to: .celsius)
                
                let kelvinToFahrenheit = kelvinConvertor.converted(to: .fahrenheit)
                let kelvinToKelvin = kelvinConvertor.converted(to: .kelvin)
                let kelvinToCelsius = kelvinConvertor.converted(to: .celsius)
                
                if temperatureUnit == "Celcius"{
                    if temperatureUnitTo == "Celcius"{
                        let formattedCelcius = formatter.string(from: NSNumber(value: celsiusToCelsius.value))
                        returnable = "\(formattedCelcius ?? "???")"
                    }
                    else if temperatureUnitTo == "Fahrenheit"{
                        let formattedFahrenheit = formatter.string(from: NSNumber(value: celsiusToFahrenheit.value))
                        returnable = "\(formattedFahrenheit ?? "???")"
                    }
                    else {
                        let formattedKelvin = formatter.string(from: NSNumber(value: celsiusToKelvin.value))
                        returnable = "\(formattedKelvin ?? "???")"
                    }
                }
                
                else if temperatureUnit == "Fahrenheit"{
                    if temperatureUnitTo == "Celcius"{
                        let formattedCelcius = formatter.string(from: NSNumber(value: fahrenheitToCelsius.value))
                        returnable = "\(formattedCelcius ?? "???")"
                    }
                    else if temperatureUnitTo == "Fahrenheit"{
                        let formattedFahrenheit = formatter.string(from: NSNumber(value: fahrenheitToFahrenheit.value))
                        returnable = "\(formattedFahrenheit ?? "???")"
                    }
                    else {
                        let formattedKelvin = formatter.string(from: NSNumber(value: fahrenheitToKelvin.value))
                        returnable = "\(formattedKelvin ?? "???")"
                    }
                }
                
                else if temperatureUnit == "Kelvin"{
                    if temperatureUnitTo == "Celcius"{
                        let formattedCelcius = formatter.string(from: NSNumber(value: kelvinToCelsius.value))
                        returnable = "\(formattedCelcius ?? "???")"
                    }
                    else if temperatureUnitTo == "Fahrenheit"{
                        let formattedFahrenheit = formatter.string(from: NSNumber(value: kelvinToFahrenheit.value))
                        returnable = "\(formattedFahrenheit ?? "???")"
                    }
                    else {
                        let formattedKelvin = formatter.string(from: NSNumber(value: kelvinToKelvin.value))
                        returnable = "\(formattedKelvin ?? "???")"
                    }
                }
                
            } else {
                return "???"
            }
            return returnable
        }
        
        
        let formatter : NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            return formatter
        }()
    }

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
