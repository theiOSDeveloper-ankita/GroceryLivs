//
//  CartItemRow.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 27/06/24.
//

import SwiftUI

struct FruitCartItemRow: View {
    @EnvironmentObject  var cartManager : CartManager
    @Binding var fruit: Item
   @Binding  var totalPrice : [String:Double]
    @State private  var fruitPrice: Double = 0.0
    
    var body: some View {
           HStack(spacing: 10){
                Image(fruit.imageName)
                    .resizable()
                    .frame(width: 100,height: 100, alignment: .leading)
                VStack(spacing: 5){
                    Text(fruit.itemName)
                        .font(.system(size: 15, weight: .light, design: .serif))
                    Text("\(fruit.weight) X \(fruit.qty)")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15, weight: .light, design: .rounded))
                    
                    Text("Rs.\(String(format: "%.1f",fruitPrice))")
                        .onAppear{
                            fruitPrice = getPrice(price: fruit.price,quantity: fruit.qty,id: fruit.id)
                        }

                        .font(.system(size: 15, weight: .light, design: .rounded))
                    
                    
                }
                VStack{
                    Stepper(
                        " "){
                            fruit.qty += 1
                        }
                onDecrement: {
                    if fruit.qty > 1 {
                        fruit.qty -= 1}
                    else {fruit.qty = 1}
                }
                    Text("qty: \(fruit.qty) ")
                        .onChange(of: fruit.qty, initial: true){
                            fruitPrice =  getPrice(price: fruit.price,quantity: fruit.qty,id: fruit.id)
                        }
                        
                }
               Spacer()
               Image(systemName: "trash")
                   .foregroundColor(.red)
                   .onTapGesture {
                           totalPrice.updateValue(0, forKey: fruit.id.uuidString)
                       cartManager.removeFromCart(fruit: fruit, vegetable: nil)
                 }
               
            }
            
           .frame(height: 100)
            .bold()
    
 }

    
    func getPrice(price: Double, quantity: Int, id: UUID) -> Double {
        if !totalPrice.isEmpty && totalPrice.contains(where: { $0.key == id.uuidString }){
                totalPrice.updateValue(price * Double(quantity), forKey: id.uuidString)
                print("Updated value:\(id.uuidString),\(quantity),\(price * Double(quantity)) ")
            return totalPrice[id.uuidString]!
                
            }
            else{
                totalPrice[id.uuidString] = price
                print("Added value:\(id.uuidString),\(quantity),\(price)")
                return price
            }

        }
   
}

#Preview {
    FruitCartItemRow(fruit: .constant(FruitItemViewModel().fruitItemList.first!), totalPrice: .constant([:]))
        .environmentObject(CartManager())
}
