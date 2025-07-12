//
//  ContentView.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    
    var playerCard = "card13"
    var cpuCard = "card7"
    
    var playerScore = 0
    var cpuScore = 0
    
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
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
            
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(CPUscore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
            }
        }
        
    }
    
    func deal() {
        print("Deal cards")
    }
}

#Preview {
    ContentView()
}
