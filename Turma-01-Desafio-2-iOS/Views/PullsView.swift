import SwiftUI

struct PullsView: View {
    var urlPullsRequests: String

    var body: some View {

            NavigationView {
                List(0..<30) { _ in
                        PullRequestCell()
                        .foregroundColor(.black)
                }
                .navigationTitle("Nome do Repo")
            }
            .navigationTitle("Pull Requests")
            .navigationViewStyle(.stack)

        }

}

struct PullsView_Previews: PreviewProvider {
    static var previews: some View {
        PullsView(urlPullsRequests: "link pros PR")
    }
}
