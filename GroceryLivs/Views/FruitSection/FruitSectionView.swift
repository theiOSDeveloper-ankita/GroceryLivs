//
//  FruitCategoryView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 20/06/24.
//

import SwiftUI

struct FruitSectionView: View {
    @StateObject var cartManager = CartManager()
    @State private var fruitItemViewModel = FruitItemViewModel()

  var columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            Text("Hi,\nLet's pick some fresh fruits right from the farm !!")
                .font(.system(size: 20, weight: .medium, design: .serif))
                .frame(alignment: .leading)
                .italic()
                .foregroundStyle(.black).opacity(0.8)
                .padding()
            Spacer()
            ScrollView(){
                LazyVGrid(columns: columns, spacing: 40){
                    ForEach(0..<fruitItemViewModel.fruitItemList.count, id: \.self){ item in
                        FruitItemView(fruit: fruitItemViewModel.fruitItemList[item])
                  }
                }
            }
        }
   
    }
}

#Preview {
    FruitSectionView()
       
}
