//
//  MealList.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

struct MealList: View {
    let meals: [Meal]
    var body: some View {
        List(meals) { meal in
            MealRow(meal: meal)
        }
    }
}

struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        HStack {
            Text(meal.typeOfMeal.rawValue)   
        }
        HStack {
            Text(meal.mealName)
        }
        VStack {
            ForEach(meal.ingredientList, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
        HStack {
            Text(formatDate(date: meal.dateOfMeal))
        }
        HStack {
            Text(meal.completedMeal ? "True": "False")
        }
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        MealList(meals: .exampleMeal)
    }
}

func formatDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY/MM/dd"
    return formatter.string(from: date)
}
