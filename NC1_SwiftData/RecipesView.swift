//
//  RecipesView.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 13/11/23.
//

import SwiftUI
import SwiftData

struct RecipesView: View {
    @Environment(\.modelContext) private var modelContext
    @State var flag: Bool = true
    @Query(FetchDescriptor(predicate: #Predicate<Recipe> {$0.isFavourite}))  var favourites: [Recipe]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            // Your content here
                            ForEach(favourites) { diet in
                                Button{
                                    //  Action
                                }label:{
                                    Text("\(diet.name)")
                                        .frame(width: 100, height: 100)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 3)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    ForEach(favourites){ rec in
                        NavigationLink{
                            Text(rec.name)
                        }label: {
                            HStack{
                                Text(rec.name)
                                    .padding()
                                
                                Spacer()
                                
                                Button {
                                    flag.toggle()
                                    rec.isFavourite = flag
                                } label: {
                                    if rec.isFavourite {
                                        Image(systemName: "star.circle.fill")
                                            .padding()
                                    } else {
                                        Image(systemName: "star.circle")
                                            .padding()
                                    }
                                }
                            }
                            .foregroundStyle(Color.black)
                            .padding()
                        }
                        .foregroundStyle(Color.black)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        .shadow(radius: 3)
                        .padding()
                    }
//                    .onDelete(perform: deleteRecipe)
                }
            }
            .navigationTitle("Recetas")
//            .searchable(text: $searchText)
//            .searchSuggestions {
//                if searchText.isEmpty {
//                    RecipesSearchSuggestions()
//                }
//            }
            
                .toolbar {
//                    ToolbarItem{
//                        EditButton()
//                    }
                    ToolbarItem(placement: .automatic) {
                        NavigationStack{
                                NavigationLink {
                                    SearchView()
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundStyle(Color.accentColor)
                                }
                        }
                    }
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
//                            addRecipe()
                        }) {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                }
                .background(Color(red: 0.983, green: 0.988, blue: 0.984))
        }
    }
//    private func deleteRecipe (offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(recipes[index])
//            }
//        }
//    }
}

#Preview {
    RecipesView()
        .modelContainer(for: Recipe.self)
}
