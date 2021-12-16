import SwiftUI

struct PullRequestCell: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
                  
        Button(action: { openURL(URL(string: "https://github.com/pedrogaldiano/Turma-01-Desafio-2-iOS")!
        )})
               {
        VStack(alignment: .leading, spacing: 3) {
            Text("título do PR")
                .bold()
                .font(.title2)
                .lineLimit(1)
            
            UserView()
            
            Text("hgfhfgh hfhfg hfhfghf descriçãodescriçãodescriçãodescriçãodescrição")
                .font(.body)
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text("20/11/2021")
                .font(.subheadline)
                .fontWeight(.light)
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
        }
    }
}

struct PullRequestCell_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestCell()
    }
}