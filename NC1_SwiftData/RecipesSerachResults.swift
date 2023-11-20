//
//  RecipesSerachResults.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 20/11/23.
//

import SwiftUI
import SwiftData

struct RecipesSerachResults<Content: View>: View {
    @Binding var searchText: String
    @Query private var recipes: [Recipe]
    private var content: (Recipe) -> Content
    
    init(searchText: Binding<String>, @ViewBuilder content: @escaping (Recipe) -> Content) {
        _searchText = searchText
        _recipes = Query(sort: \.name)
        self.content = content
    }
    
    var body: some View {
        if $searchText.wrappedValue.isEmpty{
            ForEach(recipes, content: content)
        } else {
            ForEach(recipes.filter {
                $0.name.contains($searchText.wrappedValue)
            }, content: content)
        }
    }
}


