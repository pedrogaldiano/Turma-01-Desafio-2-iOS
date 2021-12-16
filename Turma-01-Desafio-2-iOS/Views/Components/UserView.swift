import Foundation
import SwiftUI

struct UserView: View {
    let owner: Owner

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: owner.avatarUrl)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 30, height: 30)
            .cornerRadius(35)

            Text(owner.login)
                .fontWeight(.medium)
                .lineLimit(1)
                .font(.title3)
        }
    }
}
