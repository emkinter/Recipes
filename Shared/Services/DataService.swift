//
//  DataService.swift
//  Recipe List
//
//  Created by Ekkehard Koch on 2022.03.22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathString is not nil, otherwise return empty recipe list
        guard pathString != nil else{
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                //error with decoding data
                print(error)
            }
        }
        catch {
            //error with getting data
            print(error)
        }
        return [Recipe]()
    }
}
