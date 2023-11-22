//
//  RecipeCardView.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 21/11/23.
//

import SwiftUI
import SwiftData

struct RecipeCardView: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    RecipeCardView(recipe: Recipe(name: "Mango Lassi", cookingTime: 3, cal: 211, isFavourite: false, category: RecipeCategory(name: "Snack"), watCook: RecipeMethod(name: "For the way"), diet: Diet(name: "High fiber")))
}
