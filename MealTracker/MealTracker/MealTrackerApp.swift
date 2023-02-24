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
                MainView(meals: $meal.meals) {
                    MealStore.save(meals: meal.meals) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            
            //MainView(meals: $meal.meals)
            
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
        //        .onChange(of: meals) { meals in
        //            print(self.meals)
        
    }
}
