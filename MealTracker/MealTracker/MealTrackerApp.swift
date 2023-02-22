//
//  MealTrackerApp.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

@main
struct MealTrackerApp: App {
    @State var meals = [Meal].exampleMeal
    var body: some Scene {
        WindowGroup {
            MainView(meals: $meals)
        }
        .onChange(of: meals) { meals in
            print(self.meals)
            
        }
    }
}


/*
 app
    main view
        …
        meal list view
        …
 
 server -> model
 app -> controller
 ui -> view
 
 MVC
 */
