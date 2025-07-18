//
//  AddActivityButton.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/14/25.
//
import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss  // To dismiss the sheet

    var body: some View {
        VStack(spacing: 20) {
            
            
            FormView()
                
            
            Button("Close") {
                dismiss()  // Closes the sheet
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }

}

#Preview{
    AddActivityView()
}

// Come back later
//class ActivityBlock{
//
//


struct FormView: View{
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var firstTimeChoice = Date()
    @State private var secondTimeChoice = Date()
    
    var body: some View{
        NavigationStack{
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Enter starting time:", selection: $firstTimeChoice, displayedComponents:
                    .hourAndMinute)
                DatePicker("Enter ending time:", selection: $secondTimeChoice, displayedComponents:
                    .hourAndMinute)
            }
            .navigationTitle(Text("Add Activity"))
        }
    }
}
