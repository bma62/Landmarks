//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // use StateObject to initialize a model object only once during the life time of the app
    /*
     on contrast, ObservedObject is used only if that object is discarded after each use
     */
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // put object in environment as well when running on device/simulator
                .environmentObject(modelData)
        }
    }
}
