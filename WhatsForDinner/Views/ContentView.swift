//
//  ContentView.swift
//  WhatsForDinner
//
//  Created by Sailaja Gorti on 12/15/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkSerive = NetworkService()
    
    var body: some View {
        NavigationView {
            List(networkSerive.categories) { category in
                NavigationLink(destination: MealView(categoryName: category.strCategory))
                {
                HStack {
                    RemoteImage(url: category.strCategoryThumb)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    Text(category.strCategory)
                        .font(.headline)
                }
                }
            }
            .navigationTitle("What's For Dinner?")
        }
        .onAppear(perform: {
            networkSerive.fetchCategories()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
