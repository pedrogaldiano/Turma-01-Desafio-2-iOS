import SwiftUI

struct PullsView: View {
    var fullName: String
    var repoName: String
    @StateObject var pulls = PullViewModel()

    var body: some View {

        NavigationView {
            List { ForEach(pulls.pulls) { pull in
                PullRequestCell(pull: pull)
                    .foregroundColor(.black)
                    .onAppear(perform: { pulls.loadMoreContentIfNeeded(currentItem: pull, fullName: fullName)})
            }}
            .navigationTitle(repoName)
        }
        .navigationTitle("Pull Requests")
        .navigationViewStyle(.stack)

    }

}
