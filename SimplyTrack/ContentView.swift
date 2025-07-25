//
//  ContentView.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/5/25.
//


import SwiftUI

enum Screen: Hashable {
    case settings
}
    

struct ContentView: View {
    @State private var path = [Screen]()
    @State private var showAddActivity = false  // For sheet presentation
    var greeting = "hello"
    @State private var activityList = ActivityList()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 10) {
                HStack(spacing: 75) {
                    // Settings Button (navigates)
                    Button {
                        path.append(.settings)
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .foregroundStyle(.blue)
                    .font(.system(size: 30))
                    .buttonStyle(.bordered)
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 80)
                    
                    // Add Activity Button (shows sheet)
                    Button {
                        showAddActivity = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.blue)
                    .font(.system(size: 30))
                }
                ZStack(){
                    RoundedRectangle(cornerRadius: 26)
                        .fill(Color.white)
                        .foregroundStyle(.white)
                        .frame(width:360, height:90)
                        
                    //                    .sheet(isPresented: $showAddActivity){
                    //                        AddActivityView(activityList: activityList)
                    //                    }
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
                    
                    VStack{
                        Text("Current Activity: ")
                        
                        
                    }
                }
                
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(Color.white)
                    .frame(width: 360, height: 540)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
                    .overlay(
                        ScrollView{
                            VStack{
                                ForEach(activityList.activities.indices, id: \.self) {
                                    index in
                                    let activity = activityList.activities[index]
                                    VStack(alignment: .leading){
                                        Text(activity.title)
                                            .bold()
                                        Text(activity.description)
                                            .font(.subheadline)
                                    }
                                }
                            }
                        }
                    )
                
                
                // NavigationLink for Settings navigation
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .settings:
                            SettingsView()
                        }
                    }
                
            }
            // The sheet modifier presents a modal when showAddActivity is true
            .sheet(isPresented: $showAddActivity) {
                AddActivityView(activityList: activityList)
            }
        }
    }
}

// Put in a new file, SettingsButton.swift
// Destination view for navigation
//struct SettingsView: View {
//    var body: some View {
//        Text("Settings")
//            .navigationTitle("Settings")
//    }
//}

// Put in a new file, AddActivityButton.swift
// View presented as modal sheet
//struct AddActivityView: View {
//    @Environment(\.dismiss) var dismiss  // To dismiss the sheet
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Add New Activity")
//                .font(.title)
//                .padding()
//
//            Button("Close") {
//                dismiss()  // Closes the sheet
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding()
//    }
//}

#Preview {
    ContentView()
}
