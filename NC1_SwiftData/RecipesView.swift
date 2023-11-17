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
    @Query private var recipes: [Recipe]
    @Query private var diets: [Diet]
    @Query private var methods: [RecipeMethod]
    @Query private var categories: [RecipeCategory]
    @State var flag: Bool = true
    @Query(FetchDescriptor(predicate: #Predicate<Recipe> {$0.isFavourite}))  var favourites: [Recipe]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            // Your content here
                            ForEach(diets) { diet in
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
            
                .toolbar {
//                    ToolbarItem{
//                        EditButton()
//                    }
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            // Action for the first button
                        }) {
                            Image(systemName: "magnifyingglass")
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
    
//    private func addRecipe (){
//        var newName: String
//        var newCookingTime: Int
//        var newCal: Int
//        var newIsFavourite: Bool = false
//        var newCategory: RecipeCategory
//        var newRecipeMethod: RecipeMethod
//        var newDiet: Diet
//        
//        let newRecipe = Recipe(name: newName, cookingTime: newCookingTime, cal: newCal, isFavourite: newIsFavourite, category: newCategory, watCook: newRecipeMethod, diet: newDiet)
//        modelContext.insert(newRecipe)
//    }
    
//    
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
