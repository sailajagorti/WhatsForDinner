//
//  MealDetailView.swift
//  WhatsForDinner
//
//  Created by Sailaja Gorti on 12/15/20.
//

import SwiftUI

struct MealDetailView: View {
    
    var mealId: String
    @ObservedObject var networkService = NetworkService()
    
    var body: some View {
        
        List(networkService.mealDetails) { mealDetail in
            VStack {
                Text(mealDetail.strMeal)
                    .font(.title)
                Text("Category: \(mealDetail.strCategory)")
                    .font(.caption)
                RemoteImage(url: mealDetail.strMealThumb)
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                Text("Ingredients: ")
                    .fontWeight(.heavy)
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(mealDetail.strIngredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                    }
                    VStack(alignment: .leading) {
                        ForEach(mealDetail.strMeasures, id: \.self) { measure in
                            Text(measure)
                        }
                    }
                }
                .padding(20)
                .background(Color(red: 0.87, green: 0.90, blue: 0.91, opacity: 1.00))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                Text("Instructions: ")
                    .fontWeight(.heavy)
                Text(mealDetail.strInstructions)
                    .lineLimit(nil)
                
            }
        }
        .onAppear(perform: {
            networkService.fetchMealDetail(mealId: mealId)
        })
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealId: "52779")
    }
}
