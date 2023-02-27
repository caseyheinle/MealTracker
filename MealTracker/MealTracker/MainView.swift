//
//  ContentView.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

struct MainView: View {
    @Binding var meals: [Meal]
    @State private var showingSheet: Bool = false
    @State private var newMeal = Meal.newMeal()
    @State private var created = false
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        VStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Welcome to Meal Tracker!")
            MealList(meals: $meals)
            Button("Add New Meal", action: {
                self.showingSheet.toggle()
            }).frame(maxHeight: 44, alignment: .bottom)
            
        }
        .padding()
        .sheet(isPresented: $showingSheet) {
            AddMealView(meal: $newMeal, created: $created)
        }
        .onChange(of: created) { created in
            if created {
                self.meals.append(self.newMeal)
            }
            
            self.created = false
            self.newMeal = Meal.newMeal()
        }
        .onChange(of: scenePhase) { phase in
                    if phase == .inactive { saveAction() }
                }
    }
}

struct AddMealView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var meal: Meal
    @Binding var created: Bool
    
    var body: some View {
            Section(header: Text("Select the meal type")) {
                Picker("Select the meal type", selection: $meal.typeOfMeal) {
                    ForEach(MealType.allCases, id: \.self) {mealType in
                        Text(mealType.rawValue)
                    }
                }
            }
            Section(header: Text("Enter the name of the meal")) {
                TextField("Enter the name of the meal", text: $meal.mealName)
            }
            Section(header: Text("What day did you eat it?")) {
                DatePicker("", selection: $meal.dateOfMeal, displayedComponents: .date)
                    .padding()
                Toggle("Finished Meal?", isOn: $meal.completedMeal)
                Spacer()
            }
            
            Button("Press to dismiss") {
                dismiss()
            }
            Button("CREATE") {
                self.created = true
                dismiss()
            }
        }
}

struct EditMealView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var meal: Meal
    
    var body: some View {
        Section(header: Text("Edit the meal type")) {
            Picker("Edit the meal type", selection: $meal.typeOfMeal) {
                ForEach(MealType.allCases, id: \.self) {mealType in
                    Text(mealType.rawValue)
                }
            }
        }
        Section(header: Text("Edit the name of the meal")) {
            TextField("Edit the name of the meal", text: $meal.mealName)
        }
        Section(header: Text("Edit the day you ate it")) {
            DatePicker("", selection: $meal.dateOfMeal, displayedComponents: .date)
                .padding()
            Toggle("Finished Meal?", isOn: $meal.completedMeal)
            Spacer()
        }
        Button("Save Changes") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}


//struct Previews_MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        //MainView(meals: $MealList, saveAction: {})
//    }
//}
