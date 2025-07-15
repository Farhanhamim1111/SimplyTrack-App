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
            Text("Add New Activity")
                .font(.title)
                .padding()

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
