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
        
        VStack {
            
            Text("Repositórios em Swift 🍎")
                .bold()
                .font(.title)
                .padding(.horizontal)
                .padding(.bottom, 0)

            SearchBar(repoSearched: $searchText)

            NavigationView {
                List(0..<30) { _ in
                    NavigationLink(destination: PullsView(urlPullsRequests: "link pros PR"), label: {
                        RepositoryCell()
                        
                    })
                }//.padding(.top, -180)  //GAMBIARRA -- TIRAR DÚVIDA
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
