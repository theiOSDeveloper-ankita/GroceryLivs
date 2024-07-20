//
//  FruitItemViewModel.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 30/06/24.
//

import SwiftUI

class FruitItemViewModel: ObservableObject{
  @Published  var fruitItemList = [
        Item(imageName: "Apple", itemName: "Apple", weight: "1 kg", price: 150.00, color: Color.red, qty: 1),
        Item(imageName: "Banana", itemName: "Banana", weight: "1 kg", price: 50.00, color: Color.yellow, qty: 1),
        Item(imageName: "Mango", itemName: "Mango", weight: "1 kg", price: 100.00, color: Color.green, qty: 1),
        Item(imageName: "Papaya", itemName: "Papaya", weight: "1 kg", price: 40.00, color: Color.orange, qty: 1),
        Item(imageName: "Strawberry", itemName: "Strawberry", weight: "250g", price: 60.00, color: Color.red, qty: 1),
        Item(imageName: "Watermelon", itemName: "Watermelon", weight: "1 kg", price: 90.00, color: Color.green, qty: 1)
       ]
    
}


