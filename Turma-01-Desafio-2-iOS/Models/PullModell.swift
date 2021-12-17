import Foundation

struct Pull: Hashable, Codable, Identifiable {
    let htmlUrl: String
    let id: Int
    let title: String
    let user: Owner
    let body: String?
    let createdAt: Date
}
