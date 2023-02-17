//
//  Meal.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import Foundation

// codable because I need to store this. Identifiable so I can specifically reference this meal
struct Meal: Identifiable, Codable {
    let id = UUID() // I want to be able to reference each unique meal
    
    var typeOfMeal: MealType
    var mealName: String // I want to add what the meal was, e.g. "tortilla soup", "pizza", etc.
    let dateOfMeal: Date // when was the meal consumed?
    // MA: decouple this thing? @same level of meal, a struct 'dish'?
    var ingredientList: [String] // I want to be able to add what ingredients were in the meal
    // MA: perhaps a % rather than yes/no I ate all
    var completedMeal: Bool // was the meal completed, or was there food remaining on the plate
}

public enum MealType: String, Codable {
    case Breakfast
    case MorningSnack
    case Lunch
    case AfternoonSnack
    case Dinner
    case Dessert
}
