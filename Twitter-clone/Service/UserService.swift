//
//  UserService.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 26.04.2024.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fethUser(withUid uid: String, completion: @escaping(User)->Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
            }
    }
}
