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
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 3)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            padding(0 )
                

        }
        ignoresSafeArea()
        }
        
    }
    
   
    
#Preview {
    ContentView()
}
