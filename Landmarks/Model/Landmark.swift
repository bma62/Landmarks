//
//  Landmark.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable { //conform to codable to encode/decode with external representations such as JSON, identifiable to be used in list
    var id: Int // satisfies the requirement of identifiable
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable { // rely on Codable to load the data 
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // make image name property private because users of the struct care about the image only
    private var imageName: String
    var image: Image {
        Image(imageName) // load the image from asset catalog
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
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
