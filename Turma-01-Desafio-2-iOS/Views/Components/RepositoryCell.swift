import Foundation
import SwiftUI

struct RepositoryCell: View {
    var repo: Item

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {

            Text(repo.name)
                .bold()
                .font(.title2)
                .lineLimit(1)

            UserView(owner: repo.owner)

            Text(repo.description ?? "")
                .font(.body)
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            HStack(spacing: 10) {
                Label("\(repo.forksCount)", systemImage: "tuningfork")
                .font(.subheadline)
                .foregroundColor(.secondary)

                Label("\(repo.stargazersCount)", systemImage: "star")
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
    }
}
