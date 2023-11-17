//
//  Recipe.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 13/11/23.
//

import Foundation
import SwiftData

@Model
final class Recipe{
    
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
    // `.cascade` tells SwiftData to delete all animals contained in the category when deleting it.
    @Relationship(deleteRule: .cascade, inverse: \Recipe.category)
    var recipes = [Recipe]()
    
    init(name: String) {
        self.name = name
    }
}

@Model
final class RecipeMethod {
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .cascade, inverse: \Recipe.watCook)
    var recipes = [Recipe]()
    
    init(name: String) {
        self.name = name
    }
}


@Model
final class Diet {
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .cascade, inverse: \Recipe.diet)
    var recipes = [Recipe]()
    
    init(name: String) {
        self.name = name
    }
}
