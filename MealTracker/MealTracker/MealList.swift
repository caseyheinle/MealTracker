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

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        MealList(meals: .exampleMeal)
    }
}
