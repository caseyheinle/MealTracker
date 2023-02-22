//
//  MealList.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

struct MealList: View {
    @Binding var meals: [Meal]
//    @Binding var showAlert: Bool
   // @Binding var mealName = ""
    
    var body: some View {
//        ZStack {
            List($meals) { $meal in
                MealRow(meal: $meal)
//                Text("Hello")
                Button("Delete", action: {
                    meals.removeAll(where: {$0.id == $meal.id})
                })
            }
//        }
    }
}

func presentAlertController() {
    let alertController = UIAlertController(title: "Add New Meal", message: nil, preferredStyle: .alert)
    alertController.addTextField { (mealName) in
        mealName.placeholder = "Meal Name"
    }
    let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
//        if let mealName = alertController.textFields?.first, let mealName = mealName.text { }
    }
    alertController.addAction(addAction)
    //present(alertController, animated: true, completion: nil)
}

//    struct DemoView: View {
//        @State var meals = [Meal].exampleMeal
//        var body: some View {
//            MealList(meals: $meals, showAlert: $showAlert)
//        }
//    }
//    static var previews: some View {
//        DemoView()
//    }
//}
