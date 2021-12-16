import Foundation
import SwiftUI

struct UserView: View {
//    var user: User

    var body: some View {
        HStack {
            Image("img_generica")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
                .cornerRadius(10)

            Text("Nome do Ser ômano2")
                .fontWeight(.medium)
                .lineLimit(1)
                .font(.title3)
        }
    }
}
