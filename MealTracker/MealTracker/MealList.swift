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
            Text(meal.mealName)
//            Text(meal.ingredientList[0].rawValue)
//            Text(meal.dateOfMeal.formatted(Date()))
//            Text(meal.completedMeal.rawValue)
            
        }
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        MealList(meals: .exampleMeal)
    }
}
