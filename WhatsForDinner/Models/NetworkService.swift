//
//  NetworkService.swift
//  WhatsForDinner
//
//  Created by Sailaja Gorti on 12/15/20.
//

import Foundation

class NetworkService: ObservableObject {
    
    @Published var categories = [Category]()
    @Published var meals = [Meal]()
    @Published var mealDetails = [MealDetail]()
    
    func fetchCategories() {
        
        if let urlString = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let recipeData = try decoder.decode(RecipeData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.categories = recipeData.categories
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchMeals(category: String) {
        
        if let urlString = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let mealData = try decoder.decode(MealsByCategory.self, from: safeData)
                            DispatchQueue.main.async {
                                self.meals = mealData.meals
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchMealDetail(mealId: String) {
        
        if let urlString = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let mealDetailData = try decoder.decode(MealsByID.self, from: safeData)
                            DispatchQueue.main.async {
                                self.mealDetails = mealDetailData.meals
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
