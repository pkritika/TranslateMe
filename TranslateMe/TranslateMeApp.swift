//
//  TranslateMeApp.swift
//  TranslateMe
//
//  Created by Kritika  on 3/10/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct TranslateMeApp: App {
    init() { // <-- Add an init
           FirebaseApp.configure() // <-- Configure Firebase app
       }
    var body: some Scene {
        WindowGroup {
            HomePage()
        }
    }
}
