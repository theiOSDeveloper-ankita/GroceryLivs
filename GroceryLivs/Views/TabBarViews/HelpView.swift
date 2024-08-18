//
//  HelpView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 20/06/24.
//

import SwiftUI

struct HelpView: View {
    @State private var helpItems: [HelpItem] = [
            HelpItem(question: "Q1. How can you change the password?", answer: "A:- Please go to Account Section, click on password change and happily change the password."),
            HelpItem(question: "Q2. Where can I find my email id?", answer: "A:- Please go to Account Section, you can see your email id displayed at the top.")
        ]
    var body: some View {
        NavigationStack{
            List {
                ForEach($helpItems, id: \.question) { $helpItem in
                    DisclosureGroup(
                        isExpanded: $helpItem.isExpanded,
                        content: {
                            Text(helpItem.answer)
                        },
                        label: {
                            Text(helpItem.question)
                                .font(.headline)
                                .padding(.vertical, 4)
                        }
                    )
                    .animation(.easeInOut, value: helpItem.isExpanded)
                    .accentColor(.primary)
                    
                    // Use .frame to fit the content to the screen size if necessary
                    // Include this if you want to make the entire row tappable
                    .onTapGesture {
                        helpItem.isExpanded.toggle()
                    }
                }
            }
            .navigationBarTitle("FAQs")
        }
           }
}

#Preview {
    HelpView()
}
