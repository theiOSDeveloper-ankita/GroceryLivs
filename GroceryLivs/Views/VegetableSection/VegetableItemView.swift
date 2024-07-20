//
//  VegetableItemView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 07/07/24.
//

import SwiftUI

struct VegetableItemView: View {
    @State private var itemAdded: Bool = false
    @State var vegetableItemViewModel = VegetableItemViewModel()
    var vegetable : Item
    @EnvironmentObject  var cartManager : CartManager
   

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom){
                Color(vegetable.color)
                    .opacity(0.25)
                VStack{
                 Image(vegetable.imageName)
                        .resizable()
                        .frame(width: 150, height: 140)
                    Text(vegetable.itemName)
                        .font(.title)
                    Text("\(vegetable.weight) / Rs.\(String(format: "%.1f", vegetable.price))")
                        .font(.system(size: 20, design: .rounded))
                        .frame(width: 160, height: 40)
                        .background(vegetable.color)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }.padding(10)
            }.padding(10)
            
            if !itemAdded {
                Button("+"){
                    itemAdded = true
                    cartManager.addToCart(fruit: nil, vegetable: vegetable)
                    printslectedItem(item: vegetable.imageName)
                   
                }
               .font(.largeTitle)
                .frame(width: 50, height: 50)
                .background(.green)
                .foregroundStyle(.white)
                .cornerRadius(40)
                .padding(.trailing)
            }
            else{
                Button{
               print("button disabled")
              }label: {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .frame(width: 50, height: 50)
                        .background(.gray)
                        .foregroundStyle(.white)
                        .cornerRadius(40)
                        .padding(.trailing)
                }
     
            }
            
        }
        .onChange(of: itemAdded){
            if cartManager.vegetables.count == 0 {
                itemAdded = false
            }
           
        }
   }
    func printslectedItem(item: String ){
        print("\(item)")
    }
   
}

#Preview {

    VegetableItemView(vegetable: VegetableItemViewModel().vegetableItemList.first!)
        .environmentObject(CartManager())
       
}

