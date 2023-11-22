//
//  TestingContainers.swift
//  NC1_SwiftData
//
//  Created by Arantza Castro Dessavre on 22/11/23.
//
 
import Foundation
import SwiftData

public var modelContainerTester: ModelContainer = {
    let schema = Schema([
        Recipe.self,
        Diet.self,
        RecipeMethod.self,
        RecipeCategory.self
    ])
    
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
    
    do{
        return try ModelContainer(for: schema, configurations: [modelConfiguration])
    }catch{
        fatalError("Could not create modelconteinerTester: \(error)")
    }
}()
