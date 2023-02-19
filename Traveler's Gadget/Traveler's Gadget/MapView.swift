//
//  MapView.swift
//  Traveler's Gadget
//
//  Created by Gürkan Karadaş on 12.02.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static var regions : [MKCoordinateRegion] = [MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:41.0 , longitude: 29.0), span: MKCoordinateSpan(latitudeDelta: 4.0, longitudeDelta: 4.0)),MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.4925, longitude: -99.9018), span: MKCoordinateSpan(latitudeDelta:50.0, longitudeDelta: 50.0)),MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 54.5, longitude: 15.2), span: MKCoordinateSpan(latitudeDelta: 35.0, longitudeDelta: 35.0))]
    @State var selectedIndex = 0
    @State var region : MKCoordinateRegion = regions[0]
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.top)
            .overlay(
                VStack{
                    Picker("picker", selection: $selectedIndex){
                        Text("N. America").tag(1)
                        Text("Istanbul").tag(0)
                        Text("Europa").tag(2)
                    }.pickerStyle(.segmented).padding(.bottom,650)
                        .padding()
                        .onChange(of: selectedIndex, perform: {value in
                            self.region = MapView.regions[selectedIndex]
                        })
                    Spacer()
                }
                
            )
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
