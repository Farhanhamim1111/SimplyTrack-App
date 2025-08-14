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
    @State private var activityList = ActivityList()
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
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
                        .fill(Color(.secondarySystemBackground))
                        .foregroundStyle(.white)
                        .frame(width:360, height:90)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
                    
                    VStack{
                        if let current = activityList.currentActivity{
                            Text("Current Activity: ")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Text(current.title)
                                .bold()
                                .foregroundStyle(.primary)
                            HStack{
                                Text(current.firstTimeChoice.formatted(date: .omitted, time: .shortened))
                                Text("-")
                                Text(current.secondTimeChoice.formatted(date: .omitted, time: .shortened))
                            }
    
                        } else {
                            Text("No activity right now.")
                                .foregroundStyle(.secondary)
                        }
                        
                        
                    }
                }
                
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(Color(.secondarySystemBackground))
                    .frame(width: 360, height: 540)
                    .shadow(color: Color(.label).opacity(0.1), radius: 10, x: 0, y: 8)
                    .overlay(
                        ScrollView {
                            VStack{
                                ForEach(activityList.activities.sorted(by: {$0.firstTimeChoice < $1.firstTimeChoice})) {activity in
                                    VStack(alignment: .center){
                                        Text(activity.title)
                                            .bold()
                                            .foregroundStyle(.primary)
                                        Text(activity.description)
                                            .font(.subheadline)
                                            .foregroundStyle(.primary)
                                        HStack(alignment: .top){
                                            Text(activity.firstTimeChoice.formatted(date: .omitted, time: .shortened))
                                            Text("-")
                                            Text(activity.secondTimeChoice.formatted(date: .omitted, time: .shortened))
                                        }
                                    }
                                    .padding()
                                    .frame(width: 320, height: 90, alignment: .center)
                                    .background(Color.white)
                                    .cornerRadius(26)
                                    .border(Color(.systemBackground))
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
            
            .onReceive(timer) { input in
                currentTime = input
            }
        }
    }
}

extension ActivityList {
    var currentActivity: Activity? {
        let now = Date()
        return activities.first(where:  { $0.firstTimeChoice <= now && now <= $0.secondTimeChoice } )
    }
}


#Preview {
    ContentView()
}
