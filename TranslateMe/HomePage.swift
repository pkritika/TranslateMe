//
//  HomePage.swift
//  TranslateMe
//
//  Created by Kritika  on 3/10/25.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationStack{
            VStack{
//            Image("she_with_phone")
//                .resizable()
//                .frame(width: 210, height: 300)
//                Image(systemName: "globe.asia.australia.fill")
//                    .imageScale(.large)
//                        .foregroundColor(.indigo)
                Text("TranslateMe")
                    .font(.system(size: 60, weight: .heavy, design: .rounded))
                    .foregroundColor(.orange)
                    .padding()
            
//                NavigationLink(destination: ContentView()) {
//                    Text("TranslateMe")
//                        .font(.system(size: 60, weight: .heavy, design: .rounded))
//                        .foregroundColor(.orange)
//                        .padding()
//                }
                Image("she_with_phone")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 210, height: 300)
                    .padding()
                
                NavigationLink(destination: ContentView()) {
                    Text("Start")
                        .font(.system(size: 60, weight: .heavy, design: .rounded))
                        .foregroundColor(.purple)
                        .padding()
                }
            }}
    }
}

#Preview {
    HomePage()
}
