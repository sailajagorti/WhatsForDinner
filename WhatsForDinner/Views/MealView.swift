//
//  MealView.swift
//  WhatsForDinner
//
//  Created by Sailaja Gorti on 12/15/20.
//

import SwiftUI

struct MealView: View {
    
    var categoryName: String
    @ObservedObject var networkSerice = NetworkService()
    
    var body: some View {
        
        List(networkSerice.meals) { meal in
            NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                HStack {
                    RemoteImage(url: meal.strMealThumb)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    Text(meal.strMeal)
                }
            }
        }
        .onAppear(perform: {
            networkSerice.fetchMeals(category: categoryName)
        })
        .navigationTitle(categoryName)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(categoryName: "Vegetarian")
    }
}
