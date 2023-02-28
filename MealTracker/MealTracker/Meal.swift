//
//  Meal.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import Foundation

// codable because I need to store this. Identifiable so I can specifically reference this meal
struct Meal: Identifiable, Codable, Equatable, Hashable {
    let id = UUID() // I want to be able to reference each unique meal
    
    var typeOfMeal: MealType
    var mealName: String // I want to add what the meal was, e.g. "tortilla soup", "pizza", etc.
    var dateOfMeal: Date // when was the meal consumed?
    // MA: decouple this thing? @same level of meal, a struct 'dish'?
    var ingredientList: [String] // I want to be able to add what ingredients were in the meal
    // MA: perhaps a % rather than yes/no I ate all
    var completedMeal: Bool // was the meal completed, or was there food remaining on the plate
    
    init(_ typeOfMeal: MealType, mealName: String, dateOfMeal: Date, ingredientList: [String], completedMeal: Bool) {
        self.typeOfMeal = MealType.Breakfast
        self.mealName = mealName
        self.ingredientList = ingredientList
        self.dateOfMeal = Date()
        self.completedMeal = completedMeal
    }
    
    static let `default` = Meal(MealType.Breakfast, mealName: "oatmeal", dateOfMeal: Date(), ingredientList: ["milk", "steel cut oatmeal", "strawberries", "brown sugar", "cinnamon"], completedMeal: true)
    static let `default1` = Meal(MealType.Breakfast, mealName: "eggs", dateOfMeal: Date(), ingredientList: ["milk", "steel cut oatmeal", "strawberries", "brown sugar", "cinnamon"], completedMeal: true)
    static func newMeal() -> Meal {
        Meal(MealType.Breakfast, mealName: "", dateOfMeal: Date(), ingredientList: [], completedMeal: true)
    }
}

// start with an example meal for display/test purposes
extension Array where Element == Meal {
    static var exampleMeal: Self {
        [
            .default,
            .default1,
        ]
    }
}

public enum MealType: String, Codable, CaseIterable {
    case Breakfast
    case MorningSnack
    case Lunch
    case AfternoonSnack
    case Dinner
    case Dessert
    
    var name: String {
        switch self {
            
        case .Breakfast:
            return "Breakfast"
        case .MorningSnack:
            return "Morning Snack"
        case .Lunch:
            return "Lunch"
        case .AfternoonSnack:
            return "Afternoon Snack"
        case .Dinner:
            return "Dinner"
        case .Dessert:
            return "Dessert"
        }
    }
}
