//
//  User.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 26.04.2024.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
