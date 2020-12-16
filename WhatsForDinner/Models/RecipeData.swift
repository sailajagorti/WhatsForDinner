//
//  RecipeData.swift
//  WhatsForDinner
//
//  Created by Sailaja Gorti on 12/15/20.
//

import SwiftUI

struct RecipeData: Decodable {
    var categories: [Category]
}

struct Category: Decodable, Identifiable {
    var id: String {
        return idCategory
    }
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
    
}

struct MealsByCategory: Decodable {
    var meals: [Meal]
}

struct Meal: Decodable, Identifiable {
    var id: String {
        return idMeal
    }
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

struct MealsByID: Decodable {
    var meals: [MealDetail]
}

struct MealDetail: Decodable, Identifiable {
    var id: String {
        return idMeal
    }
    var idMeal: String
    var strMeal: String
    var strCategory: String
    var strInstructions: String
    var strMealThumb: String
    var strYoutube: String
    var strIngredient1: String
    var strIngredient2: String
    var strIngredient3: String
    var strIngredient4: String
    var strIngredient5: String
    var strIngredient6: String
    var strIngredient7: String
    var strIngredient8: String
    var strIngredient9: String
    var strIngredient10: String
    var strIngredient11: String
    var strIngredient12: String
    var strIngredient13: String
    var strIngredient14: String
    var strIngredient15: String
    var strMeasure1: String
    var strMeasure2: String
    var strMeasure3: String
    var strMeasure4: String
    var strMeasure5: String
    var strMeasure6: String
    var strMeasure7: String
    var strMeasure8: String
    var strMeasure9: String
    var strMeasure10: String
    var strMeasure11: String
    var strMeasure12: String
    var strMeasure13: String
    var strMeasure14: String
    var strMeasure15: String
    
    var strIngredients: [String] {
        return [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15]
    }
    var strMeasures: [String] {
        return [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15]
    }
}
