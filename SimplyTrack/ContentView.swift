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
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card3")
                    Spacer()
                }
                Spacer()
            
                Button("Deal") {
                    print("Deal cards")
                }
                .foregroundStyle(.white)
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text("0")
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text("0")
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
