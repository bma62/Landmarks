//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import SwiftUI

struct LandmarkList: View {
    
    // as many views will be using the model data, find it in environmentObject rather than observedObject
    @EnvironmentObject var modelData: ModelData
    
    // states are always private because they hold information that is specific to a view and its subviews
    @State private var showFavoritesOnly = false
    
    // show all landmarks when filter off and show favorite landmarks when filter on
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        // lists need identifiable data
        // \.id is a key path to a property that uniquely idenfies each element
        NavigationView {
            List {
                // $ prefix accesses the binding to a state variable
                Toggle("Favorites Only", isOn: $showFavoritesOnly)
                
                // change to use ForEach instead of List show the toggle is part of the list as well
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
            LandmarkList()
                .environmentObject(ModelData())
    }
}
