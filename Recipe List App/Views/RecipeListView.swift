//
//  ContentView.swift
//  Recipe List App
//
//  Created by Arne Finnern on 13.02.21.
//

import SwiftUI

struct RecipeListView: View {
    
    //Reference the View Model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
            
        NavigationView {
            List(model.recipes) { r in
                
              NavigationLink(
                destination: RecipeDetailView(recipe:r),
                label: {
                    
                    //MARK: row item
                    HStack(spacing: 20.0) {
                    Image(r.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipped()
                    Text(r.name)
                    }
                    
                })
               
            }
            .navigationBarTitle("My Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
