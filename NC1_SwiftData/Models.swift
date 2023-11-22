//
//  Models.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 22/11/23.
//

import Foundation
import SwiftData

@Model
public class Recipe{
    
    var name: String
    var cookingTime: Int
    var cal: Int
    var isFavourite: Bool = false
    var category: RecipeCategory
    var watCook: RecipeMethod
    var diet: Diet
    
    init(name: String, cookingTime: Int, cal: Int, isFavourite: Bool, category: RecipeCategory, watCook: RecipeMethod, diet: Diet) {
        self.name = name
        self.cookingTime = cookingTime
        self.cal = cal
        self.isFavourite = isFavourite
        self.category = category
        self.watCook = watCook
        self.diet = diet
    }
}


@Model
final class RecipeCategory {
    @Attribute(.unique) var name: String
    var logo: String
    // `.cascade` tells SwiftData to delete all animals contained in the category when deleting it.
    @Relationship(deleteRule: .cascade, inverse: \Recipe.category)
    var recipes = [Recipe]()
    
    init(name: String, logo: String, recipes: [Recipe] = [Recipe]()) {
        self.name = name
        self.logo = logo
        self.recipes = recipes
    }
}

@Model
final class RecipeMethod {
    @Attribute(.unique) var name: String
    var logo: String
    @Relationship(deleteRule: .cascade, inverse: \Recipe.watCook)
    var recipes = [Recipe]()
    
    init(name: String, logo: String, recipes: [Recipe] = [Recipe]()) {
        self.name = name
        self.logo = logo
        self.recipes = recipes
    }
}


@Model
final class Diet {
    @Attribute(.unique) var name: String
    var logo: String
    @Relationship(deleteRule: .cascade, inverse: \Recipe.diet)
    var recipes = [Recipe]()
    
    init(name: String, logo: String, recipes: [Recipe] = [Recipe]()) {
        self.name = name
        self.logo = logo
        self.recipes = recipes
    }
}
