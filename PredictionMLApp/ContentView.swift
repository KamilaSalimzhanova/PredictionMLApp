//
//  ContentView.swift
//  PredictionMLApp
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var titanic: TitanicModel = .init(
        passengerClass: "Second Class",
        sex: "male",
        age: 18,
        siblingsSpouses: 2,
        parentsChildren: 4,
        fare: 5,
        port: "Cherbourg")
    @State private var survival: Bool? = nil
    @State private var showAlert: Bool = false
    @State private var survivalRate: Double = -1
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    SegmentSectionView(selected: $titanic.passengerClass, options: TitanicModel.passClass, sectionTitle: "Passenger class", prompt: "What passenger class are you in?")
                    
                    SegmentSectionView(selected: $titanic.sex, options: TitanicModel.genders, sectionTitle: "Gender", prompt: "What is your gender?")
                    
                    FormSectionView(text: "Passenger class", newView: "To do")
                    FormSectionView(text: "Passenger class", newView: "To do")
                    FormSectionView(text: "Passenger class", newView: "To do")
                    FormSectionView(text: "Passenger class", newView: "To do")
                    
                    SegmentSectionView(selected: $titanic.port, options: TitanicModel.ports, sectionTitle: "Port", prompt: "What port did you embark from?")
                    
                    if showAlert {
                        Text("show alert")
                    }
                }
            }
            .navigationTitle("Surviving model")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        
                    }) {
                        Text("Compute")
                            .foregroundColor(.red)
                            .bold()
                            .opacity(showAlert ? 0 : 1)
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
