//
//  ContentView.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mealStore: MealStore
    @State private var showingSheet: Bool = false
    @State private var showingIngredientsSheet: Bool = false
    @State private var newMeal = Meal.newMeal()
    @State private var created = false
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        let _ = Self._printChanges() //debug
        
        VStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Welcome to Meal Tracker!")
            MealList(meals: $mealStore.meals)
            Button("Add New Meal", action: {
                self.showingSheet.toggle()
            }).frame(maxHeight: 44, alignment: .bottom)
            
        }
        .padding()
        .sheet(isPresented: $showingSheet) {
            AddMealView(meal: $newMeal, created: $created, isSheetPresented: $showingIngredientsSheet)
        }
        .onChange(of: created) { created in
            if created {
                self.mealStore.meals.append(self.newMeal)
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
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        Section(header: Text("Select the meal type")) {
            Picker("Select the meal type", selection: $meal.typeOfMeal) {
                ForEach(MealType.allCases, id: \.self) {mealType in
                    Text(mealType.name)
                }
            }
        }
        Section(header: Text("Enter the name of the meal")) {
            TextField("Meal name", text: $meal.mealName).textFieldStyle(RoundedBorderTextFieldStyle())
        }
        Section(header: Text("Ingredients")) {
            List($meal.ingredientList, id:\.self) {$ingredient in
                Text(ingredient.text)
            }
            Button("Add Ingredients") {
                isSheetPresented = true
            }
            .sheet(isPresented: $isSheetPresented) {
                AddIngredientSheetView(isSheetPresented: $isSheetPresented, meal: $meal)
            }
        }
        Section(header: Text("Intention")) {
            TextField("What was your intention during this meal?", text: $meal.intention).textFieldStyle(RoundedBorderTextFieldStyle())
        }
        Section(header: Text("What day did you eat it?")) {
            DatePicker("", selection: $meal.dateOfMeal, displayedComponents: .date)
                .padding()
            Toggle("Finished Meal?", isOn: $meal.completedMeal)
            Spacer()
        }
        Section(header: Text("How full are you?")) {
            VStack {
                Slider(value: $meal.satiation, in: 0...10, step: 1)
                Text("\(meal.satiation, specifier: "%.1f")")
                
            }
            
        }
        
        Button("Press to dismiss") {
            dismiss()
        }
        Button("Add Meal") {
            self.created = true
            dismiss()
        }
    }
}


struct EditMealView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var meal: Meal
    
    var body: some View {
        Section(header: Text("Edit the meal type").font(.title)) {
            Picker("Edit the meal type", selection: $meal.typeOfMeal) {
                ForEach(MealType.allCases, id: \.self) {mealType in
                    Text(mealType.name)
                }
            }
        }
        Section(header: Text("Edit the name of the meal")) {
            TextField("Edit the name of the meal", text: $meal.mealName).textFieldStyle(RoundedBorderTextFieldStyle())
        }
        Section(header: Text("Edit the ingredients in the meal")) {
            List {
                ForEach($meal.ingredientList, id: \.self) { ingredient in
                    TextField("Edit the ingredients", text: ingredient)
                }
            }
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
        Button("Press to dismiss") {
            dismiss()
        }
    }
}

struct AddIngredientSheetView: View {
    @State var newIngredient: String = ""
    @Binding var isSheetPresented: Bool
    @Binding var meal: Meal
    
    
    
    var body: some View {
        VStack {
            TextField("Ingredient ", text: $newIngredient)
                .padding()
            Button("Add Ingredient") {
                let ingredient = Ingredients(text: newIngredient)
                meal.ingredientList.append(ingredient)
                isSheetPresented = false
            }
            .padding()
        }
    }
}

//struct Previews_MainView: PreviewProvider {
//    static var previews: some View {
//        MainView(meals: $meals, saveAction: {})
//    }
//}
