//
//  SearchBar.swift
//  Turma-01-Desafio-2-iOS
//
//  Created by PEDRO GALDIANO DE CASTRO on 15/12/21.
//

import Foundation
import SwiftUI

struct SearchBar: View{
    @Binding var repoSearched: String
    @State private var isEditing = false
    
    var body: some View {
        
        HStack() {
            TextField("Search ...", text: $repoSearched)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.repoSearched = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    })
            
                .padding(.horizontal, 20)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button("Submit", action: {
                    print("submited")
                    print(self.repoSearched)
                    self.isEditing = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                })
                    .padding(.trailing, 20)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: isEditing)
            }
        }
    }
}

