//
//  HomeScreen.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 18/06/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var showfruitscreen: Bool = false
    @State private var showvegetablescreen: Bool = false
 
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome to Grocery Livs")
                    .font(.title)
                    .italic().bold()
                    .foregroundStyle(.purple)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                Text("Greetings,\nLet's order some fresh items for you")
                    .font(.system(size: 20, weight: .light, design: .rounded))
                    .foregroundStyle(.purple).opacity(0.80)
                    .frame(width: 320, alignment: .leading)
                    .padding()
                
                Button(){
                    showfruitscreen = true
                    
                }label: {
                    HStack {
                        Image("fruitBasket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200, alignment: .leading)
                        Spacer().frame(width: 40)
                        Text("Fruits")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundStyle(.black)
                    }
                }
                NavigationLink(destination: FruitSectionView(), isActive: $showfruitscreen){
                    EmptyView()
                }
                
                Button(){
                    showvegetablescreen = true
                }label: {
                    HStack {
                        Image("VegetableBasket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 300,alignment: .leading)
                        
                        Text("Vegetables")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundStyle(.black)
                    }
                }
                NavigationLink(destination: VegetableSectionView(), isActive: $showvegetablescreen){
                    EmptyView()
                }
                
                
            }
        }}
    }
    

#Preview {
    HomeScreenView()
}
