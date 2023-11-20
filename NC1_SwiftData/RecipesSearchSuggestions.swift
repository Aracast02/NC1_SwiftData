//
//  RecipesSearchSuggestions.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 20/11/23.
//

import SwiftUI
import SwiftData

struct RecipesSearchSuggestions: View {
    @Query private var recipes: [Recipe]
    
    var recipesNames: [String]{
        Set(recipes.map(\.name)).sorted()
    }
    
    var body: some View {
        ForEach(recipesNames, id: \.self) { recipeName in
            Text("**\(recipeName)**")
                .searchCompletion(recipeName)
        }
    }
}
