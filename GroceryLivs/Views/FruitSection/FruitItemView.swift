//
//  GroceryItem.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 20/06/24.
//

import SwiftUI

struct FruitItemView: View {
    @State private var itemAdded: Bool = false
    @State var fruitItemViewModel = FruitItemViewModel()
    var fruit : Item
    @EnvironmentObject  var cartManager : CartManager
   

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(){
                Color(fruit.color)
                    .opacity(0.25)
                VStack{
                 Image(fruit.imageName)
                        .resizable()
                        .frame(width: 150, height: 140)
                    Text(fruit.itemName)
                        .font(.title)
                    Text("\(fruit.weight) / Rs.\(String(format: "%.1f", fruit.price))")
                        .font(.system(size: 20, design: .rounded))
                        .frame(width: 160, height: 40)
                        .background(fruit.color)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }.padding(10)
            }.padding(10)
            
            if !itemAdded {
                Button("+"){
                    itemAdded = true
                    cartManager.addToCart(fruit: fruit, vegetable: nil)
                    printslectedItem(item: fruit.imageName)
                   
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
            if cartManager.fruits.count == 0 {
                itemAdded = false
            }
           
        }
   }
    func printslectedItem(item: String ){
        print("\(item)")
    }
   
}

#Preview {

    FruitItemView(fruit: FruitItemViewModel().fruitItemList.first!)
        .environmentObject(CartManager())
       
}

