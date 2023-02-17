//
//  Meal.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import Foundation

// codable because I need to store this. Identifiable so I can specifically reference this meal
struct Meals: Identifiable, Codable {
    var id = UUID() // I want to be able to reference each unique meal
    
    var typeOfMeal: String // going to be a fixed set of strings to choose from: breakfast, morning snack, lunch, afternoon snack, dinner, dessert. TODO: build the MealTypes class
    var mealName: String // I want to add what the meal was, e.g. "tortilla soup", "pizza", etc.
    var ingredientList: [String] // I want to be able to add what ingredients were in the meal
    var completedMeal: Bool // was the meal completed, or was there food remaining on the plate
}
