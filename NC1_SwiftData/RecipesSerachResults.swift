//
//  RecipesSerachResults.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 20/11/23.
//

import SwiftUI
import SwiftData

struct RecipesSerachResults: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var searchText: String
    @Query private var recipes: [Recipe]
    @Query private var diets: [Diet]
    
    init(searchText: Binding<String>) {
        _searchText = searchText
        _recipes = Query(sort: \.name)
    }
    
    var body: some View {
        if $searchText.wrappedValue.isEmpty{
            ForEach(recipes) { recipe in
                RecipeCardView(recipe: recipe)
            }
        } else {
            ForEach(recipes.filter {
                $0.name.contains($searchText.wrappedValue)
            }, content: {
                RecipeCardView(recipe: $0)
            })
        }
    }
}


