//
//  AddActivityButton.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/14/25.
//
import SwiftUI
import Observation

enum Repeater: String, CaseIterable{
    case Daily, Weekly, Monthly
}

@Observable class ActivityList {
    var activities: [Activity] = []
    
    func addActivity(_ activity: Activity){
        self.activities.append(activity)
    }
}

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var activityList: ActivityList
    @State private var activity: Activity = Activity(title: "", description: "")
    
    var body: some View {
        VStack(spacing: 20) {
            
            FormView(activity: activity)
            
            Button("Add") {
                activityList.addActivity(activity)
                dismiss()
            }
            .buttonStyle(.bordered)
                        
            Button("Close") {
                dismiss()  // Closes the sheet
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }

}

#Preview{
    AddActivityView(activityList: ActivityList())
}



struct FormView: View{
    @Bindable var activity: Activity
    
    var body: some View{
        NavigationStack{
            Form {
                TextField("Title", text: $activity.title)
                TextField("Description", text: $activity.description)
                DatePicker("Enter starting time:", selection: $activity.firstTimeChoice, displayedComponents:
                        .hourAndMinute)
                DatePicker("Enter ending time:", selection: $activity.secondTimeChoice, displayedComponents:
                        .hourAndMinute)
                Toggle("Do you want activity to repeat?", isOn: $activity.wantFrequency)
                    .animation(.easeInOut, value: activity.wantFrequency)
                if activity.wantFrequency{
                    Picker("Choose a Repeater",selection: $activity.repeater){
                        ForEach(Repeater.allCases, id: \.self){ selection in
                            Text(selection.rawValue)
                        }
                    }
                }
            }
            .navigationTitle(Text("Add Activity"))
            
        }
    }
}

@Observable class Activity{
    var title: String = ""
    var description: String = ""
    var firstTimeChoice = Date()
    var secondTimeChoice = Date()
    var wantFrequency = false
    var repeater = Repeater.Daily
    
    init(title: String, description: String, firstTimeChoice: Date = Date(), secondTimeChoice: Date = Date(), wantFrequency: Bool = false, repeater: Repeater = Repeater.Daily) {
        self.title = title
        self.description = description
        self.firstTimeChoice = firstTimeChoice
        self.secondTimeChoice = secondTimeChoice
        self.wantFrequency = wantFrequency
        self.repeater = repeater
        
    }
}
