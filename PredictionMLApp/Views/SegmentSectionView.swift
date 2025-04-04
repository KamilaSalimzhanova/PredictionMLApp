//
//  SegmentSectionView.swift
//  PredictionMLApp
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct SegmentSectionView: View {
    @Binding var selected: String
    let options: [String]
    let sectionTitle: String
    let prompt: String
    
    var body: some View {
        Section {
            Text(prompt)
                .fontWeight(.semibold)
            Picker(prompt, selection: $selected) {
                ForEach(options, id:\.self) { currentSelected in
                    Text(currentSelected)
                        .tag(currentSelected)
                }
            }.pickerStyle(.segmented)
        } header: {
            Text(sectionTitle)
        }

    }
}

struct SegmentSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            SegmentSectionView(selected: .constant("Second Class"), options: TitanicModel.passClass, sectionTitle: "Passenger class", prompt: "What passenger class are you in?")
            
            SegmentSectionView(selected: .constant("Cherbourg"), options: TitanicModel.ports, sectionTitle: "Port", prompt: "What port did you embark from")
        }
    }
}
