//
//  Traveler_s_GadgetApp.swift
//  Traveler's Gadget
//
//  Created by Gürkan Karadaş on 11.02.2023.
//

import SwiftUI

@main
struct Traveler_s_GadgetApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                        HStack{
                            Text("Conversion")
                            Image(systemName: "thermometer")
                        }
                    }
                MapView()
                    .tabItem {
                        HStack{
                            Text("Map")
                            Image(systemName: "map")
                                
                        }
                    }
            }.accentColor(.blue)
        }
    }
}
