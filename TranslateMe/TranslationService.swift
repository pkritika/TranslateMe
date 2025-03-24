//
//  TranslationService.swift
//  TranslateMe
//
//  Created by Kritika  on 3/23/25.
//

import Foundation

class TranslationService {
    func translate(text: String, from sourceLang: String, to targetLang: String, completion: @escaping (String?) -> Void) {
        let urlString = "https://api.mymemory.translated.net/get?q=\(text)&langpair=\(sourceLang)|\(targetLang)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let result = try JSONDecoder().decode(TranslationResponse.self, from: data)
                completion(result.responseData.translatedText)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

