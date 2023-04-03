//
//  ContentView.swift
//  CharacterCounter
//
//  Created by 髙津悠樹 on 2023/03/31.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var characterCount: Int = 0
    @State private var includeSpaces: Bool = true
    @State private var isDarkMode: Bool = false
    
    var body: some View {
        let backgroundColor = isDarkMode ? Color.black : Color.white
        let textColor = isDarkMode ? Color.white : Color.black
        
        return VStack(spacing: 20) {
            Text("Character Counter")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(textColor)
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
            
            TextEditor(text: $inputText)
                .border(Color.gray, width: 1)
                .padding()
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
                .onChange(of: inputText) { newValue in
                    characterCount = countCharacters(text: newValue, includeSpaces: includeSpaces)
                }
            
            Toggle(isOn: $includeSpaces) {
                Text("Include spaces")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(textColor)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
            }
            .padding()
            .onChange(of: includeSpaces) { _ in
                characterCount = countCharacters(text: inputText, includeSpaces: includeSpaces)
            }
            
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(textColor)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
            }
            .padding()
            
            Text("Character count: \(characterCount)")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(textColor)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
        }
        .padding()
        .background(backgroundColor.ignoresSafeArea())
    }
    
    func countCharacters(text: String, includeSpaces: Bool) -> Int {
        if includeSpaces {
            return text.count
        } else {
            return text.filter { !$0.isWhitespace }.count
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
