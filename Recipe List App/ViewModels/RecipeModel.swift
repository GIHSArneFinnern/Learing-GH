//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Arne Finnern on 13.02.21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an Instance of data servic and get the data
        self.recipes = DataService.getLocalData()
        
    }
}
