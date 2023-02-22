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
    
    var body: some View {
        VStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Welcome to Meal Tracker!")
            MealList(meals: $meals)
            Button("Add New Meal 3", action: {
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
    }
}

func addNewMeal() {
    print("persist entered stuff here")
}

//struct MealListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(meals: [Meal].exampleMeal)
//    }
//}

struct AddMealView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var meal: Meal
    @Binding var created: Bool
    
    var body: some View {
        TextField("Enter the name of the meal", text: $meal.mealName)
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
        TextField("Enter the name of the meal", text: $meal.mealName)
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}
