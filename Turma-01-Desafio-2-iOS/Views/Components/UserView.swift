import Foundation
import SwiftUI

struct UserView: View {
    let owner: Owner

    var body: some View {
        HStack {
            Image("img_generica")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
                .cornerRadius(10)

            Text(owner.login)
                .fontWeight(.medium)
                .lineLimit(1)
                .font(.title3)
        }
    }
}
