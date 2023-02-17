//
//  ContentView.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Welcome to Meal Tracker!")
        }
        .padding()
        
        MealList(meals: .exampleMeal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
