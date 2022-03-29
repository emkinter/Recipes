//
//  Ingredient.swift
//  Recipes
//
//  Created by Ekkehard Koch on 2022.03.29.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
