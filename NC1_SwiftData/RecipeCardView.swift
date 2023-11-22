//
//  RecipeCardView.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 22/11/23.
//

import SwiftUI
import SwiftData

struct RecipeCardView: View {
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.ultraThinMaterial)
            Text(recipe.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.foreground)
                .accessibilityHeading(.h3)
                .accessibilityLabel("Recipe name")
        }
    }
}



#Preview {
    let exCategory = RecipeCategory(name: "Lunch", logo: "")
    let exmethod = RecipeMethod(name: "Easy", logo: "String")
    let exDiet = Diet(name: "Vegetarian", logo: "")
    let ex = Recipe(name: "Vegetable Stir-Fry", cookingTime: 15, cal: 330, isFavourite: false, category: exCategory, watCook: exmethod, diet: exDiet)
    
    modelContainerTester.mainContext.insert(exCategory)
    modelContainerTester.mainContext.insert(exmethod)
    modelContainerTester.mainContext.insert(exDiet)
    modelContainerTester.mainContext.insert(ex)

    return RecipeCardView(recipe: ex)
        .modelContainer(modelContainerTester)
}
