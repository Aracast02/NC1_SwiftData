//
//  NC1_SwiftDataApp.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 13/11/23.
//

import SwiftUI
import SwiftData

@main
struct NC1_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            RecipesView()
        }
        .modelContainer(sharedModelContainer)
    }
}

@MainActor
let sharedModelContainer: ModelContainer = {
    let schema = Schema([
        Recipe.self,
        Diet.self,
        RecipeMethod.self,
        RecipeCategory.self
    ])
    
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

    do {
        let container = try ModelContainer(for: schema)

        // Make sure the persistent store is empty. If it's not, return the non-empty container.
        var dietFetchDescriptor = FetchDescriptor<Diet>()
        dietFetchDescriptor.fetchLimit = 1
        
        
        var wayToCookFetchDescriptor = FetchDescriptor<RecipeMethod>()
        wayToCookFetchDescriptor.fetchLimit = 1
        
        
        var catFetchDescriptor = FetchDescriptor<RecipeCategory>()
        catFetchDescriptor.fetchLimit = 1
        
        
        var recipeFetchDescriptor = FetchDescriptor<Recipe>()
        recipeFetchDescriptor.fetchLimit = 1

        guard try container.mainContext.fetch(dietFetchDescriptor).count == 0 && container.mainContext.fetch(wayToCookFetchDescriptor).count == 0 && container.mainContext.fetch(catFetchDescriptor).count == 0 && container.mainContext.fetch(recipeFetchDescriptor).count == 0 else { return container }

        // This code will only run if the persistent store is empty.
        
        let categories = [
            RecipeCategory(name: "Breakfast", logo: "☕️"),
            RecipeCategory(name: "Luch", logo: "🍲"),
            RecipeCategory(name: "Dinner", logo: "🥗"),
            RecipeCategory(name: "Snack", logo: "🍎")
        ]
        
        let methods = [
            RecipeMethod(name: "Easy" , logo: "👍"),
            RecipeMethod(name: "For the way", logo: "🍌"),
            RecipeMethod(name: "Few ingridients", logo: "🛒"),
            RecipeMethod(name: "Baked", logo: "🥧"),
            RecipeMethod(name: "Au gratin", logo: "🥘")
        ]
        
        let diets = [
            Diet(name: "Vegeterian", logo: "🧀"),
            Diet(name: "Vegan", logo: "🌱"),
            Diet(name: "High protein", logo: "🍳"),
            Diet(name: "High fiber", logo: "🍠"),
            Diet(name: "Keto", logo: "🥓"),
            Diet(name: "Pescatarian", logo: "🐟")
        ]
        
        let recipes = [
            Recipe(name: "Cheese and avocado sandwich", cookingTime: 15, cal: 633, isFavourite: false, category: categories[0], watCook: methods[0], diet: diets[0]),
            Recipe(name: "Mango Lassi", cookingTime: 3, cal: 211, isFavourite: false, category: categories[3], watCook: methods[2], diet: diets[3]),
            Recipe(name: "Greek salad", cookingTime: 7, cal: 226, isFavourite: false, category: categories[1], watCook: methods[1], diet: diets[1]),
            Recipe(name: "Egg soup", cookingTime: 10, cal: 119, isFavourite: false, category: categories[2], watCook: methods[0], diet: diets[5]),
            Recipe(name: "Chicken pesto au gratin", cookingTime: 40, cal: 652, isFavourite: false, category: categories[2], watCook: methods[4], diet: diets[2]),
            Recipe(name: "Banana muffins with chocolate chips", cookingTime: 25, cal: 152, isFavourite: false, category: categories[3], watCook: methods[3], diet: diets[4]),
            Recipe(name: "Psyllium bread", cookingTime: 45, cal: 184, isFavourite: false, category: categories[0], watCook: methods[3], diet: diets[4]),
            Recipe(name: "Brownies", cookingTime: 28, cal: 267, isFavourite: false, category: categories[3], watCook: methods[3], diet: diets[4]),
            Recipe(name: "Veggie Pasta Primavera", cookingTime: 20, cal: 320, isFavourite: false, category: categories[1], watCook: methods[0], diet: diets[0]),
            Recipe(name: "Berry Yogurt Parfait", cookingTime: 5, cal: 190, isFavourite: false, category: categories[3], watCook: methods[2], diet: diets[3]),
            Recipe(name: "Roasted Chicken with Vegetables", cookingTime: 60, cal: 410, isFavourite: false, category: categories[2], watCook: methods[4], diet: diets[2]),
            Recipe(name: "Baked Cod with Lemon Butter", cookingTime: 25, cal: 290, isFavourite: false, category: categories[2], watCook: methods[4], diet: diets[5]),
            Recipe(name: "Classic Margherita Pizza", cookingTime: 30, cal: 400, isFavourite: false, category: categories[2], watCook: methods[3], diet: diets[0]),
            Recipe(name: "Zucchini Noodles with Pesto", cookingTime: 15, cal: 220, isFavourite: false, category: categories[1], watCook: methods[0], diet: diets[1]),
            Recipe(name: "Shrimp and Avocado Salad", cookingTime: 20, cal: 345, isFavourite: false, category: categories[1], watCook: methods[1], diet: diets[5]),
            Recipe(name: "Sweet Potato and Black Bean Chili", cookingTime: 45, cal: 310, isFavourite: false, category: categories[2], watCook: methods[0], diet: diets[0]),
            Recipe(name: "Peanut Butter Banana Smoothie", cookingTime: 5, cal: 275, isFavourite: false, category: categories[3], watCook: methods[2], diet: diets[3]),
            Recipe(name: "Beef and Broccoli Stir-Fry", cookingTime: 30, cal: 420, isFavourite: false, category: categories[1], watCook: methods[0], diet: diets[2]),
            Recipe(name: "Spicy Tofu Stir-Fry", cookingTime: 20, cal: 345, isFavourite: false, category: categories[1], watCook: methods[0], diet: diets[1]),
            Recipe(name: "Almond Berry Smoothie", cookingTime: 5, cal: 180, isFavourite: false, category: categories[3], watCook: methods[2], diet: diets[3]),
            Recipe(name: "Quinoa and Black Bean Salad", cookingTime: 15, cal: 310, isFavourite: false, category: categories[1], watCook: methods[1], diet: diets[0]),
            Recipe(name: "Grilled Salmon with Herbs", cookingTime: 25, cal: 420, isFavourite: false, category: categories[2], watCook: methods[0], diet: diets[5]),
            Recipe(name: "Avocado Egg Toast", cookingTime: 10, cal: 250, isFavourite: false, category: categories[0], watCook: methods[0], diet: diets[3]),
            Recipe(name: "Cauliflower Pizza", cookingTime: 30, cal: 500, isFavourite: false, category: categories[2], watCook: methods[3], diet: diets[4]),
            Recipe(name: "Lentil Soup", cookingTime: 35, cal: 265, isFavourite: false, category: categories[2], watCook: methods[0], diet: diets[3]),
            Recipe(name: "Oatmeal with Fresh Fruits", cookingTime: 10, cal: 220, isFavourite: false, category: categories[0], watCook: methods[0], diet: diets[3]),
            Recipe(name: "Vegan Chocolate Cake", cookingTime: 50, cal: 390, isFavourite: false, category: categories[3], watCook: methods[3], diet: diets[1]),
            Recipe(name: "Chicken Caesar Salad", cookingTime: 20, cal: 475, isFavourite: false, category: categories[1], watCook: methods[1], diet: diets[2])
        ]

        for diet in diets {
            container.mainContext.insert(diet)
        }
        
        for meth in methods {
            container.mainContext.insert(meth)
        }
        
        for category in categories {
            container.mainContext.insert(category)
        }
        
        for rec in recipes {
            container.mainContext.insert(rec)
        }

        return container
        
    } catch {
        fatalError("Could not create conteiner: \(error)")
    }
}()
