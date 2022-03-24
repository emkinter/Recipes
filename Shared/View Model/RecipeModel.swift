//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Ekkehard Koch on 2022.03.22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and ge the data
        self.recipes = DataService.getLocalData()
    }
    
}
