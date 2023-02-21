//
//  MealRow.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/21/23.
//

import SwiftUI

struct MealRow: View {
    @Binding var meal: Meal
    
    var body: some View {
        VStack {
            Text(meal.typeOfMeal.rawValue)
            Text(meal.mealName)
            ForEach(meal.ingredientList, id: \.self) { ingredient in
                Text(ingredient)
            }
            Text(formatDate(date: meal.dateOfMeal))
            Text(meal.completedMeal ? "True": "False")
            
            Button("Add New Meal", action: {
                //let newMeal = Meal(<#T##typeOfMeal: MealType##MealType#>, mealName: <#T##String#>, dateOfMeal: <#T##Date#>, ingredientList: <#T##[String]#>, completedMeal: <#T##Bool#>)
                //MealRow.append(newMeal)
            })
        }
    }
}

func formatDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY/MM/dd"
    return formatter.string(from: date)
}
