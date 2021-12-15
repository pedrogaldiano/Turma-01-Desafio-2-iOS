//
//  ReposistoryView.swift
//  Turma-01-Desafio-2-iOS
//
//  Created by PEDRO GALDIANO DE CASTRO on 15/12/21.
//

import SwiftUI

struct RepositoriesView: View {
    @State private var searchText = ""
    
    var body: some View {
        
        VStack() {

            Text("Repositórios em Swift 🍎")
                .bold()
                .font(.title)
                .padding(.horizontal)
                .padding(.bottom, 0)
        
            SearchBar(repoSearched: $searchText)
            
            List(0..<30) { _ in
                RepositoryCell()
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RepositoriesView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
