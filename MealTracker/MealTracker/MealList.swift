//
//  MealList.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

struct MealList: View {
    @Binding var meals: [Meal]
    
    var body: some View {
        ZStack {
            List($meals) { $meal in
                MealRow(meal: $meal)
            }
            Button("Add New Meal", action: {
                let newMeal = Meal(MealType.Lunch, mealName: "Added via New Meal Button", dateOfMeal: Date(), ingredientList: ["String"], completedMeal: true)
                meals.append(newMeal)
            }).frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct MealList_Previews: PreviewProvider {
    struct DemoView: View {
        @State var meals = [Meal].exampleMeal
        var body: some View {
            MealList(meals: $meals)
        }
    }
    static var previews: some View {
        DemoView()
    }
}
