import SwiftUI

struct PullsView: View {
    var fullName: String
    var repoName: String
    @StateObject var pulls = PullViewModel()

    var body: some View {

        NavigationView {
            List(pulls.pulls) { pull in
                PullRequestCell(pull: pull)
                    .foregroundColor(.black)
            }
            .navigationTitle(repoName)
            .onAppear(perform: {
                pulls.getPullRequestsFromRepo(fullName: fullName)
            })
        }
        .navigationTitle("Pull Requests")
        .navigationViewStyle(.stack)

    }

}
