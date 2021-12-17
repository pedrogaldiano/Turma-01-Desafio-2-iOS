import Foundation

struct Pull: Hashable, Codable, Identifiable {
    let url: String
    let id: Int
    let title: String
    let user: Owner
    let body: String
    let createdAt: Date

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        let owner = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .user)

        url = try values.decode(String.self, forKey: .url)
        id = try values.decode(Int.self, forKey: .id)

        title = try values.decode(String.self, forKey: .title)

        user = try owner.decode(Owner.self, forKey: .user)

        body = try values.decode(String.self, forKey: .body)
        createdAt = try values.decode(Date.self, forKey: .createdAt)
    }
}
