//
//  Landmark.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // make image name property private because users of the struct care about the image only
    private var imageName: String
    var image: Image {
        Image(imageName) // load the image from asset catalog
    }
    
    // create our own Coordinates struct to match the storage in the JSON data structure
    private var coordinates: Coordinates
    
    // compute a property to use with MapKit
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
        
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
