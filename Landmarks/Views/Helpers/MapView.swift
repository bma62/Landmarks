//
//  MapView.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    // use State for transient data owned by the view
    // when modifying it from more than one view, SwiftUI will automatically update views that depend on it
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        // use $ prefix with state variable to pass a binding to this view to read-write to the state variable
        Map(coordinateRegion: $region)
            // trigger calculation of the region when view appears
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    // MARK: Private Methods
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
