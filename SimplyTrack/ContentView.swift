//
//  ContentView.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Text("")
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width:100, height: 80)
                Spacer()
                
                Button("+") {
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .foregroundStyle(.black)
                .font(.largeTitle)
                Spacer()
                
            }
                
                Spacer()
            
            RoundedRectangle(cornerRadius: 13)
                .stroke(Color.black, lineWidth: 7)
                .frame(width:400, height: 650)
        }
        
        }
        
    }
    
   
    
#Preview {
    ContentView()
}
