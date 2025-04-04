//
//  SliderSectionView.swift
//  PredictionMLApp
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct SliderSectionView: View {
    @Binding var val: Double
    let sectionTitle: String
    let prompt: String
    let minValue: Double
    let maxValue: Double
    let step: Double
    var body: some View {
        Section(sectionTitle) {
            Text(prompt).fontWeight(.semibold)
            Slider(value: $val, in: minValue...maxValue, step: step)
                .tint(.black)
        }
    }
}

struct SliderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            SliderSectionView(val: .constant(5), sectionTitle: "Parents and children", prompt: "Number of parents and children \(5)", minValue: 0, maxValue: 20, step: 1)
        }
    }
}
