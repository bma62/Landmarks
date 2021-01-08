//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-07.
//

import SwiftUI

struct FavoriteButton: View {
    
    // use binding to read-write to the data source
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(.yellow)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
