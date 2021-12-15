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
        
        NavigationView{
            
            List(0..<30) { _ in
                RepositoryCell()
                
            }
        }
        .searchable(text: $searchText)
        
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
