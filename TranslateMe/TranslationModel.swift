//
//  TranslationModel.swift
//  TranslateMe
//
//  Created by Kritika  on 3/23/25.
//

import Foundation

struct TranslationResponse: Codable {
    let responseData: TranslatedText
}

struct TranslatedText: Codable {
    let translatedText: String
}

