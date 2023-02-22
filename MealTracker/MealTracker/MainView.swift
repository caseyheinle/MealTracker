//
//  ContentView.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

struct MainView: View {
    @Binding var meals: [Meal]
//    @State private var showAlert: Bool = false
//    @State var typeOfMeal = ""
//    @State var mealName = ""
//    @State var mealName = ""
//    @State var mealName = ""
//    @State var mealName = ""
    init(meals: [Meal]) {
        self.meals = meals
    }
    
    var body: some View {
        VStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Welcome to Meal Tracker!")
            Text("Welcome to Meal Tracker \(self.meals.count)")
        }
        .padding()
        
        MealList(meals: $meals, showAlert: true)
//            .alert("Add New Meal", isPresented: $showAlert) {
//                TextField("Select the meal type", text: $typeOfMeal)
//                TextField("Enter the name of the meal", text: $mealName)
                //TextField("Ent")
//                Button("Add", action: addNewMeal)
//            }
    }
}

func addNewMeal() {
    print("persist entered stuff here")
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(meals: [Meal].exampleMeal)
    }
}
