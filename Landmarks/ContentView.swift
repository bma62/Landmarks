//
//  ContentView.swift
//  Landmarks
//
//  Created by Boyi Ma on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                //
                .ignoresSafeArea(edges: .top)
                .frame(height: 300.0)
            
            // overlay the image with map by adding y offset
            // also, add y padding so the view below it can take up the empty space after offseting
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130.0)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
