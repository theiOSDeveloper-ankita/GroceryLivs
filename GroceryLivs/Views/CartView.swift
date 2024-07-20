
//  Orders.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 20/06/24.


import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
   @State private var total = 0.0
   @State private var startPrice: Bool = false
    @State private var totalPrice : [String:Double] = [:]
   
  var body: some View {
       VStack{
         Text("My Cart Items")
             .bold()
               .font(.largeTitle)
          
           if cartManager.fruits.count > 0 || cartManager.vegetables.count > 0{
               List{
                   ForEach(cartManager.fruits,id: \.id){
                       item in
                       FruitCartItemRow(fruit: $cartManager.fruits[getIndex(item: item, groceryType: cartManager.fruits)], totalPrice: $totalPrice)
                       
                       
                   }
                   ForEach(cartManager.vegetables,id: \.id){
                       item in
                       VegetableCartItemRow(vegetable: $cartManager.vegetables[getIndex(item: item, groceryType: cartManager.vegetables)],totalPrice: $totalPrice)
                       
                       
                   }
               }
               Spacer()
               HStack{
                   Text("Total Price : ")
                       .font(.system(size: 20, weight: .semibold, design: .serif))
                   Text("Rs.\(String(format: "%.2f",total))")
                           .font(.system(size: 20, weight: .semibold, design: .serif))
                   }.frame(height: 50)
                   .padding()
                   .onChange(of: totalPrice){ 
                       if !startPrice{
                               total = getPriceValue()
                               startPrice = true
                                  }
                                  else{
                                      total = totalPrice.values.reduce(0,+)
                                      
                                  }
                }

               Button("Proceed to Checkout"){
                   print("Click to Pay")
               }.frame(width: 250, height: 30)
                   .padding()
                   .background(.green)
                   .cornerRadius(15)
                   .foregroundColor(.white)
                   .font(.system(size: 20, weight: .heavy, design: .rounded))
           }
            else{
               Spacer()
               Text("Your cart is empty")
                   .font(.system(size: 50, weight: .medium, design: .serif))
                   .frame(width: 250, alignment: .center)
                   .italic()
                   .foregroundStyle(.green)
               Spacer()
               
               
                   
           }
      }.environmentObject(cartManager)
          
        }
 
    func getIndex(item: Item,groceryType: [Item]) -> Int{
            return groceryType.firstIndex{
                (item1) -> Bool in
                return item.id == item1.id
            } ?? 0
      
    }
    func getPriceValue() -> Double{
        for itemprice in cartManager.fruits{
            total += itemprice.price
        }
        for itemprice in cartManager.vegetables{
            total += itemprice.price
        }
    return total
    }

}


#Preview {
    CartView()
        .environmentObject(CartManager())
       
}

