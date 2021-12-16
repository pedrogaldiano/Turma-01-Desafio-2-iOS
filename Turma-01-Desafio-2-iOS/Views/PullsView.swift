import SwiftUI

struct PullsView: View {
    var urlPullRequests: String
    var repoName: String
    @StateObject var pulls = PullViewModel()

    var body: some View {

        NavigationView {
            List(pulls.pulls) { pull in
                PullRequestCell(pull: pull)
                    .foregroundColor(.black)
            }
            .navigationTitle(repoName)
            .navigationBarItems(leading: Button("API Call") {
                pulls.getPullRequestsFromRepo(url: urlPullRequests)
                print("api called")
            })

//            .onAppear {
//                pulls.getPullRequestsFromRepo(url: urlPullRequests)
//            }
        }
        .navigationTitle("Pull Requests")
        .navigationViewStyle(.stack)

    }

}
