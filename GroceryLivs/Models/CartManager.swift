//
//  CartManager.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 26/06/24.
//

import Foundation

class CartManager: ObservableObject {
  @Published var fruits: [Item] = []
    @Published var totallprice = 0.00
    @Published var vegetables: [Item] = []
    
    
    func addToCart(fruit: Item?, vegetable: Item? = nil) {
        if let fruit = fruit{
            fruits.append(fruit)
        }
        if let vegetable = vegetable{
            vegetables.append(vegetable)
        }
        
        
    }
    
    func removeFromCart(fruit: Item?, vegetable: Item?) {
        if let fruit = fruit{
            fruits = fruits.filter {$0.id != fruit.id }
        }
        if let vegetable = vegetable{
            vegetables = vegetables.filter {$0.id != vegetable.id}
        }
        
       
    }

}
