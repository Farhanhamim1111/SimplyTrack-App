//
//  ContentView.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack (spacing: 10){
            HStack (spacing:75){
               
                
                Button{
                    
                } label: {

                    Image(systemName: "gearshape")
                        
                }
                    .foregroundStyle(.blue)
                    .font(Font.system(size:30))
                    .buttonStyle(.bordered)
                    
                Image("logo")
                    .resizable()
                    .frame(width:100, height: 80)
                Button{
                    
                } label: {
                    Image(systemName: "plus")
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.blue)
                .font(Font.system(size:30))
                
            }
            ZStack(){
                
                RoundedRectangle(cornerRadius: 26)
                    .fill(Color.white)
                    .foregroundStyle(.white)
                    .frame(width:360, height:90)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
                    
                Text("Current Activity: ")
                    .font(.system(size:25, weight: .medium, design: .default))
            }
            
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(Color.white)
                .frame(width: 360, height: 540)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
        }
        }
        
    }
    
   
    
#Preview {
    ContentView()
}

//struct ContentView: View {
//    var body: some View {
//        
//    }
//}
