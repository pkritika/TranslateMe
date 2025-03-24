//
//  HistoryView.swift
//  TranslateMe
//
//  Created by Kritika  on 3/23/25.
//

import SwiftUI


import SwiftUI

struct HistoryView: View {
    @State private var translations: [Translation] = []
    let firestoreService = FirestoreService()

    var body: some View {
        VStack {
            List(translations) { translation in
                VStack(alignment: .leading) {
                    Text("English: \(translation.original)")
                        .font(.headline)
                        .foregroundStyle(.orange)
                    Text("Spanish: \(translation.translated)")
                        .foregroundColor(.black)
                }
            }

            Button("Clear History") {
                firestoreService.deleteAllTranslations()
                fetchHistory()
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            fetchHistory()
        }
        .navigationTitle("Translation History")

    }

    func fetchHistory() {
        firestoreService.fetchTranslations { translations in
            DispatchQueue.main.async {
                self.translations = translations
            }
        }
    }
}

#Preview {
    HistoryView()
}
