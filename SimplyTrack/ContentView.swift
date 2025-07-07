//
//  ContentView.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0){
        Image("Conquest")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(15)
            
            HStack{
                Text("Conquest")
                    .font(.title)
                    .fontWeight(.bold)
                
                
             
                Image(systemName: "star.fill")
            }
        
        }
    }
}

#Preview {
    ContentView()
}
