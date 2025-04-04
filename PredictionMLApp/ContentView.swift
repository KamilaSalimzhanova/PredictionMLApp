//
//  ContentView.swift
//  PredictionMLApp
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI
import CoreML

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
                    
                    SliderSectionView(val: $titanic.age, sectionTitle: "Age", prompt: "Age: \(titanic.age.formatted())", minValue: 0, maxValue: 120, step: 0.5)
                    
                    SliderSectionView(val: $titanic.siblingsSpouses, sectionTitle: "Siblings and spouses", prompt: "Siblings and spouses: \(titanic.siblingsSpouses.formatted())", minValue: 0, maxValue: 20, step: 1)
                    
                    SliderSectionView(val: $titanic.parentsChildren, sectionTitle: "Parents and children", prompt: "Parent and children: \(titanic.parentsChildren.formatted())", minValue: 0, maxValue: 20, step: 1)
                    
                    SliderSectionView(val: $titanic.fare, sectionTitle: "Ticker Price", prompt: "Ticket and price: \(titanic.fare.formatted())", minValue: 0, maxValue: 600, step: 0.1)
                    
                    SegmentSectionView(selected: $titanic.port, options: TitanicModel.ports, sectionTitle: "Port", prompt: "What port did you embark from?")

                }
                .scrollIndicators(.hidden)
                .blur(radius: showAlert ? 5 : 0)
                .allowsHitTesting(!showAlert)
                if showAlert {
                    Button {
                        withAnimation { showAlert.toggle() }
                    } label: {
                        if let survival {
                            Text(survival ? "Survived ✅" : "Not Survived  ❌")
                                .padding()
                                .foregroundColor(.black)
                                .bold()
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(20)
                        } else {
                            Text("Prediction failed ❌")
                                .padding()
                                .background(Color.red.opacity(0.3))
                        }
                    }
                }
            }
            .navigationTitle("Surviving model")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        computeSurvival()
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
    
    private func computeSurvival() {
        do {
            let config = MLModelConfiguration()
            let model = try TitanicTabularRegression_2(configuration: config)
            let prediction = try model.prediction(
                Pclass: titanic.pClass,
                Sex: titanic.sex,
                Age: titanic.age,
                SibSp: titanic.siblingsSpouses,
                Parch: titanic.parentsChildren,
                Fare: titanic.fare,
                Embarked: String(titanic.port.first ?? "C")
            )
            survivalRate = prediction.Survived
            print(survivalRate)
            survival = prediction.Survived > 0.5
        } catch {
            survival = nil
        }
        
        DispatchQueue.main.async {
            showAlert = true // ✅ Ensure UI updates
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
