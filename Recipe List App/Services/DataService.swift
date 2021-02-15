//
//  DataService.swift
//  Recipe List App
//
//  Created by Arne Finnern on 13.02.21.
//

import Foundation

class DataService {
    
     static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        //Get a URL path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if pathString is not nil otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data objext
            let data = try Data(contentsOf: url)
            
            // decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add unique ids
                for r in recipeData {
                    r.id = UUID()
                }
                
                // return the recipes
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch {
            // error with getting data
            print(error)
        }
     
        return [Recipe]()
    }
    
}
