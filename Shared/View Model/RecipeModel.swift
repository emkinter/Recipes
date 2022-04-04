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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServing:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        if ingredient.num != nil {
            //Get a single serving size by multiplying denominator by the recipe serving size
            denominator *= recipeServings
            //Get target portion by kmultiplying the numerator by target servings
            numerator *= targetServing
            //Reduce fractions by greatest common divisor
            let greatestCommonDivisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= greatestCommonDivisor
            denominator /= greatestCommonDivisor
            //Get the whole portion if numerator > denomiator
            if numerator >= denominator {
                //calculate whole portion
                wholePortions = numerator / denominator
                //calculate remainder
                numerator = numerator % denominator
                // Assing to portion string
                portion += String(wholePortions)
            }
            //Express the remainder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            //If we need to pluralize
            if wholePortions > 1 {
                //Calculate appropirate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            //Calculate appropritate suffix
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
    
}
