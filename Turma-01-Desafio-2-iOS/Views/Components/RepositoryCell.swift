//
//  RepositoryCell.swift
//  Turma-01-Desafio-2-iOS
//
//  Created by PEDRO GALDIANO DE CASTRO on 15/12/21.
//

import Foundation
import SwiftUI

struct RepositoryCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            
            Text("nome do repodasdadadsadasdsadadasdsasdadsas")
                .bold()
                .font(.title2)
                .lineLimit(1)
            
            UserView()
                 
            Text("hgfhfgh hfhfg hfhfghf descrição")
                .font(.body)
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                
            
            HStack(spacing: 10){
                Label("120", systemImage: "tuningfork")
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                
                Label("3565", systemImage: "star")
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
    }
}

