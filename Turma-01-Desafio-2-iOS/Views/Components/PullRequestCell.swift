import SwiftUI

struct PullRequestCell: View {
    @Environment(\.openURL) var openURL
    var pull: Pull
    var body: some View {

        Button(action: { openURL(URL(string: "https://github.com/pedrogaldiano/Turma-01-Desafio-2-iOS")!) }, label: {
        VStack(alignment: .leading, spacing: 3) {

            HStack {
                Text(pull.title)
                .bold()
                .font(.title2)
                .lineLimit(1)

                Spacer()

                Image(systemName: "arrow.up.forward.square.fill")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .topTrailing)

            }
            UserView(owner: pull.user)

            Text(pull.body)
                .font(.body)
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Text(String(describing: pull.createdAt))
                .font(.subheadline)
                .fontWeight(.light)
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
        })
    }
}
