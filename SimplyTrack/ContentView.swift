//
//  ContentView.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.systemMint)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20.0){
                Image("Conquest")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                
                HStack{
                    Text("Conquest")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    VStack{
                        HStack{
                            Image(systemName: "star.fill")
                            
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.fill")
                        }
                        .foregroundColor(.orange)
                        .font(.caption)
                        
                        Text("(Reviews)")
                    }
                    
                }
                
                Text("Conquest")
                
                HStack{
                    Spacer()
                    Image(systemName: "binoculars.fill")
                    Image(systemName: "fork.knife")
                }
                .foregroundColor(.gray)
                .font(.caption)
            }
            .padding()
            .background(Rectangle()
                .foregroundStyle(.white)
                .cornerRadius(15.0)
                .shadow(radius: 15.0))
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
