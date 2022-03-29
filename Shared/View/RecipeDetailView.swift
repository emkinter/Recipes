//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Ekkehard Koch on 2022.03.22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView{
            VStack (alignment: .leading){
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    ForEach (recipe.ingredients) { item in
                        Text("• " + item.name)
                    }
                }
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach (0..<recipe.directions.count, id: \.self) { i in
                        Text(String(i + 1) + ". " + recipe.directions[i])
                            .padding(.bottom, 5.0)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
