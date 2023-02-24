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
        TextField("Enter the name of the meal", text: $meal.mealName)
        DatePicker("What day did you eat it?", selection: $meal.dateOfMeal, displayedComponents: .date)
       
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
        TextField("Edit the name of the meal", text: $meal.mealName)
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MealList(meals: meals.exampleMeal, saveAction: {})
//        }
//    }
//}
