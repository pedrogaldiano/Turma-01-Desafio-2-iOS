import SwiftUI

struct PullsView: View {
    var repoName: String
    @ObservedObject var pulls: PullViewModel

    init(fullName: String, repoName: String) {
        self.repoName = repoName
        pulls = PullViewModel(fullName: fullName)
    }

    var body: some View {

        NavigationView {
            List { ForEach(pulls.pulls) { pull in
                PullRequestCell(pull: pull)
                    .foregroundColor(.black)
                    .onAppear(perform: { pulls.loadMoreContentIfNeeded(currentItem: pull )})
            }}
            .navigationTitle(repoName)
        }
        .navigationTitle("Pull Requests")
        .navigationViewStyle(.stack)
        .onAppear {
            pulls.initialize()
        }

    }

}
