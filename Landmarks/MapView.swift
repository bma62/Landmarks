//
//  MapView.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // use State for transient data owned by the view
    // when modifying it from more than one view, SwiftUI will automatically update views that depend on it
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        // use $ prefix with state variable to pass a binding to this view to read-write to the state variable
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
