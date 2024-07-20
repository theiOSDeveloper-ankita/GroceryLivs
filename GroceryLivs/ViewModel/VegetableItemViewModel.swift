//
//  VegetableItems.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 20/06/24.
//

import SwiftUI

class VegetableItemViewModel: ObservableObject{
  @Published  var vegetableItemList = [
    Item(imageName: "brinjal", itemName: "Brinjal", weight: "1 kg", price: 40.00, color: Color.purple, qty: 1),
    Item(imageName: "brocoli", itemName: "Broccoli", weight: "500 g", price: 80.00, color: Color.green, qty: 1),
    Item(imageName: "cabbage", itemName: "Cabbage", weight: "1 kg", price: 50.00, color: Color.green.opacity(2.0), qty: 1),
    Item(imageName: "cauliflower", itemName: "Cauliflower", weight: "1 kg", price: 40.00, color: Color.green.opacity(8.0), qty: 1),
    Item(imageName: "onion", itemName: "Onion", weight: "1 kg", price: 30.00, color: Color.pink, qty: 1),
    Item(imageName: "potato", itemName: "Potato", weight: "1 kg", price: 20.00, color: Color.brown, qty: 1),
    Item(imageName: "tomato", itemName: "Tomato", weight: "1 kg", price: 25.00, color: Color.red, qty: 1)
       ]
    
}
