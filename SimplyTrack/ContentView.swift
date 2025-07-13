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
                
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width:100, height: 80)
                Spacer()
                
                //
                Button{
                    
                } label: {
//
                    Image(systemName: "plus.square")
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .foregroundStyle(.black)
                .font(Font.system(size:40))
                
                
                Spacer()
                
            }
            
            Text("Current Activity: ")
                .font(.system(size:20, weight: .bold))
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 13)
                .stroke(Color.black, lineWidth: 7)
                .frame(width:320, height: 560)
                
        }
        
        
        
        }
        
    }
    
   
    
#Preview {
    ContentView()
}
