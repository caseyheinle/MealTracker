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
        List($meals) { $meal in
            MealRow(meal: $meal)
            Button("Delete", action: {
                meals.removeAll(where: {$0.id == $meal.id})
            })
        }
    }
}
