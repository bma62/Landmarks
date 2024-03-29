//
//  ModelData.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import Foundation
import Combine

/*
 final prevents the class from being inherited or overridden
 SwiftUI subscribes to ObservableObject and updates any views that depend on this data
*/
final class ModelData: ObservableObject {
    // publish any changes to the landmarks data 
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    // hikes won't be modified, so no need to publish changes
    var hikes: [Hike] = load("hikeData.json")
    
    @Published var profile = Profile.default

    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // a dictionary that use category string as key and have values of an array of landmarks
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue })
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // get the file URL
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    // read from the file
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // decode the JSON file
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
