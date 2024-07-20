//
//  VegetableCartItemRow.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 07/07/24.
//

import SwiftUI

struct VegetableCartItemRow: View {
    @EnvironmentObject  var cartManager : CartManager
    @Binding var vegetable: Item
   @Binding  var totalPrice : [String:Double]
    @State private  var vegetablePrice: Double = 0.0
    var body: some View {
           HStack(spacing: 10){
                Image(vegetable.imageName)
                    .resizable()
                    .frame(width: 100,height: 100, alignment: .leading)
                VStack(spacing: 5){
                    Text(vegetable.itemName)
                        .font(.system(size: 15, weight: .light, design: .serif))
                    Text("\(vegetable.weight) X \(vegetable.qty)")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15, weight: .light, design: .rounded))
                    
                    Text("Rs.\(String(format: "%.1f",vegetablePrice))")
                        .onAppear{
                            vegetablePrice = getPrice(price: vegetable.price,quantity: vegetable.qty,id: vegetable.id)
                        }

                        .font(.system(size: 15, weight: .light, design: .rounded))
                    
                    
                }
                VStack{
                    Stepper(
                        " "){
                            vegetable.qty += 1
                        }
                onDecrement: {
                    if vegetable.qty > 1 {
                        vegetable.qty -= 1}
                    else {vegetable.qty = 1}
                }
                    Text("qty: \(vegetable.qty) ")
                        .onChange(of: vegetable.qty, initial: true){
                            vegetablePrice =  getPrice(price: vegetable.price,quantity: vegetable.qty,id: vegetable.id)
                        }
                        
                }
               Spacer()
               Image(systemName: "trash")
                   .foregroundColor(.red)
                   .onTapGesture {
                           totalPrice.updateValue(0, forKey: vegetable.id.uuidString)
                       cartManager.removeFromCart(fruit: nil, vegetable:vegetable)
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
    VegetableCartItemRow(vegetable: .constant(VegetableItemViewModel().vegetableItemList.first!), totalPrice: .constant([:]))
        .environmentObject(CartManager())
}
