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
    var ingredientList: [Ingredients]
    var intention: String // what was the intention during the meal? Intention examples: appreciating the different meal textures, not eating while distracted, etc.
    var completedMeal: Bool // was the meal completed, or was there food remaining on the plate
    var satiation: Double // how hungry are you after finishing the meal?
    
    init(_ typeOfMeal: MealType, mealName: String, dateOfMeal: Date, ingredientList: [Ingredients], intention: String, completedMeal: Bool, satiation: Double) {
        self.typeOfMeal = MealType.Breakfast
        self.mealName = mealName
        self.ingredientList = ingredientList
        self.intention = intention
        self.dateOfMeal = Date()
        self.completedMeal = completedMeal
        self.satiation = satiation
    }
    
//    static let `default` = Meal(MealType.Breakfast, mealName: "oatmeal", dateOfMeal: Date(), ingredientList: Ingredients["milk", "steel cut oatmeal", "strawberries", "brown sugar", "cinnamon"], intention: "Not be on my phone while eating", completedMeal: true, satiation: 9)
//    static let `default1` = Meal(MealType.Breakfast, mealName: "eggs", dateOfMeal: Date(), ingredientList: ["milk", "steel cut oatmeal", "strawberries", "brown sugar", "cinnamon"], intention: "Taste the cinnamon and sweetness of the berries", completedMeal: true, satiation: 7)

    static func newMeal() -> Meal {
        Meal(MealType.Breakfast, mealName: "", dateOfMeal: Date(), ingredientList: [], intention: "", completedMeal: true, satiation: 0)
    }
}

// start with an example meal for display/test purposes
//extension Array where Element == Meal {
//    static var exampleMeal: Self {
//        [
//            .default,
//            .default1,
//        ]
//    }
//}

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

