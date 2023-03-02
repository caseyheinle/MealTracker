//
//  DataStore.swift
//  MealTracker
//
//  Created by Casey Heinle on 2/23/23.
//
// Almost direct lift from https://developer.apple.com/tutorials/app-dev-training/persisting-data

import Foundation
import SwiftUI

class MealStore: ObservableObject {
    @Published var meals: [Meal] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("meals.data")
    }
    
    static func load(completion: @escaping (Result<[Meal], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let meals = try JSONDecoder().decode([Meal].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(meals))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(meals: [Meal], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(meals)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(meals.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
