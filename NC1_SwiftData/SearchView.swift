//
//  SearchView.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 20/11/23.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    @Query private var diets: [Diet]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: [.init(.adaptive(minimum: 300))]) {
                    RecipesSerachResults(searchText: $searchText)
                }
            }
            .searchable(text: $searchText)
            .searchSuggestions{
                if searchText.isEmpty{
                    RecipesSearchSuggestions()
                }
            }
        }
        .navigationTitle("Results")
    }
}

#Preview {
    SearchView()
        .modelContainer(for: Recipe.self)
}

//NavigationStack{
//    List{
//        if $searchText.wrappedValue.isEmpty{
//            ForEach(diets){ diet in
//                Text(diet.name)
//            }
//        }
//    }
//}
