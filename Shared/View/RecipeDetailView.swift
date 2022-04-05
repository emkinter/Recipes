//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Ekkehard Koch on 2022.03.22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        ScrollView{
            VStack (alignment: .leading){
                //MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                //MARK: Serving Size Picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir Heavy", size: 16))
                    Picker("", selection: $selectedServingSize){
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                        Text("6").tag(6)
                        Text("7").tag(7)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.bottom, 5.0)
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServing: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
                //MARK: Divider
                Divider()
                VStack(alignment: .leading){
                    //MARK: Directions
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.vertical, 5)
                    ForEach (0..<recipe.directions.count, id: \.self) { i in
                        Text(String(i + 1) + ". " + recipe.directions[i])
                            .padding(.bottom, 5.0)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
