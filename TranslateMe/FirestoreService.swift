//
//  FirestoreService.swift
//  TranslateMe
//
//  Created by Kritika  on 3/23/25.
//

import FirebaseFirestore

class FirestoreService {
    private let db = Firestore.firestore()
    private let collectionName = "translations"

    func saveTranslation(original: String, translated: String) {
        let newDoc = db.collection(collectionName).document()
        newDoc.setData([
            "original": original,
            "translated": translated,
            "timestamp": Timestamp()
        ])
    }

    func fetchTranslations(completion: @escaping ([Translation]) -> Void) {
        db.collection(collectionName)
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else {
                    completion([])
                    return
                }

                let translations = documents.map { doc -> Translation in
                    let data = doc.data()
                    return Translation(
                        id: doc.documentID,
                        original: data["original"] as? String ?? "",
                        translated: data["translated"] as? String ?? ""
                    )
                }

                completion(translations)
            }
    }

    func deleteAllTranslations() {
        db.collection(collectionName).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            for doc in documents {
                doc.reference.delete()
            }
        }
    }
}
