//
//  FormSectionView.swift
//  PredictionMLApp
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct FormSectionView: View {
    let text: String
    let newView: String
    var body: some View {
        Section(text) {
            Text(newView)
        }
    }
}

struct FormSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionView(text: "text", newView: "to do")
    }
}
