//
//  SearchBar.swift
//  Turma-01-Desafio-2-iOS
//
//  Created by PEDRO GALDIANO DE CASTRO on 15/12/21.
//

import Foundation
import SwiftUI

//struct searchBar: View {
//    @State private var searchText = ""
//    
//    var body: some View {
//        NavigationView {
//            Text("text")
//                .searchable(text: searchText, prompt: "Search...")
//        }
//    }
//}


//struct SearchBar: View{
//    @Binding var repoSearched: String
//    @State private var isEditing = false
//    var body: some View {
//
//        HStack() {
//            TextField("Search ...", text: $repoSearched)
//                .padding(7)
//                .padding(.horizontal, 25)
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
//
//                .overlay(
//                    HStack{
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading, 8)
//
//                        if isEditing {
//                            Button(action: {
//                                self.repoSearched = ""
//                            }) {
//                                Image(systemName: "multiply.circle.fill")
//                                    .foregroundColor(.gray)
//                                    .padding(.trailing, 8)
//                            }
//                        }
//                    })
//
//                .padding(.horizontal, 20)
//                .onTapGesture {
//                    self.isEditing = true
//                }
//            if isEditing {
//                Button(action: {
//                    self.isEditing = false
//                    self.repoSearched = "" }) {
//                        Text("Cancel")
//                    }
//                    .padding(.trailing, 20)
//                    .transition(.move(edge: .trailing))
//                    .animation(.default, value: isEditing)
//            }
//        }
//    }
//}
