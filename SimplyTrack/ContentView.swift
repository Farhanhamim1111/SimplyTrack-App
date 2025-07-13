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
                
                Button{
                    
                } label: {
//
                    Image(systemName: "gearshape")
                        
                }
                    .foregroundStyle(.blue)
                    .font(Font.system(size:40))
                    .buttonStyle(.bordered)
                    
                    
                
                
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width:100, height: 80)
                Spacer()
                
                //
                Button{
                    
                } label: {
//
                    Image(systemName: "plus")
                }
                .buttonStyle(.bordered)
                
                .foregroundStyle(.blue)
                .font(Font.system(size:40))
                
                
                Spacer()
                
            }
            ZStack{
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(radius: 10.0)
                
                Text("Current Activity: ")
                    .font(.system(size:25, weight: .medium, design: .default))
                    
                
            }
            
            
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 13)
                .foregroundStyle(.white)
                .frame(width:340, height: 560)
                .shadow(radius: 10.0)
                .padding()
        }
        
        
        
        }
        
    }
    
   
    
#Preview {
    ContentView()
}
