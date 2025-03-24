//
//  ContentView.swift
//  TranslateMe
//
//  Created by Kritika  on 3/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userText: String = ""
    @State private var translatedText: String = ""
    let translationService = TranslationService()
    let firestoreService = FirestoreService()
    
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Enter text to translate", text: $userText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                    .accentColor(.black)
                    .padding(.top, 40)
                    .padding()
                
                Button("Translate") {
                    translateText()
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.black) .font(.system(size: 20, weight: .bold, design: .rounded))
                .cornerRadius(10)
                
                Text(translatedText)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.orange.opacity(0.8))
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .background(Color.white)
                    .cornerRadius(10)
                
                Spacer()
                
                NavigationLink(destination: HistoryView()) {
                    Text("View History")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.black) .font(.system(size: 20, weight: .bold, design: .rounded))

                                      
                                      
                                      
                                      
                                      
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationTitle(Text(""))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                                Text("TranslateMe")
                        .padding(.top, 60)
                        .font(.system(size: 40, weight: .heavy, design: .rounded))
                                    .foregroundColor(.orange)
                            }
                        }
        }
    }
    
    func translateText() {
        translationService.translate(text: userText, from: "en", to: "es") { translation in
            DispatchQueue.main.async {
                if let translated = translation {
                    self.translatedText = translated
                    firestoreService.saveTranslation(original: userText, translated: translated)
                } else {
                    self.translatedText = "Translation failed"
                }
            }
        }
    }
}
#Preview {
    ContentView()
}


//NavigationLink(destination: SavedWords()) {
//    Text("View saved translation")
//        .font(.headline)
//        .foregroundColor(.black)
//        .padding()
//        .background(Color.white)
//        .cornerRadius(10)
//        .padding()
