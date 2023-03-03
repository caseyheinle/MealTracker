//
//  MealTrackerApp.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

@main
struct MealTrackerApp: App {
    @StateObject private var meal = MealStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView(mealStore: meal) {
                    MealStore.save(meals: meal.meals) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            
            .onAppear {
                MealStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let meals):
                        meal.meals = meals
                    }
                }
            }
        }
    }
}
