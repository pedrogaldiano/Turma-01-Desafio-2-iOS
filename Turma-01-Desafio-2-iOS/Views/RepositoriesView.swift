import SwiftUI

struct RepositoriesView: View {
    @State private var searchText = ""
    
    var body: some View {
                   
            NavigationView {
                List(0..<30) { _ in
                    NavigationLink(destination: PullsView(urlPullsRequests: "String"), label: {
                        RepositoryCell()
                    })
                }
                .navigationTitle("Repos em Swift")
            }
            .navigationViewStyle(.stack)
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                print(searchText)
            }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RepositoriesView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
