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
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Character Counter")
                .font(.largeTitle)
            
            TextEditor(text: $inputText)
                .border(Color.gray, width: 1)
                .padding()
                .onChange(of: inputText) { newValue in
                    characterCount = newValue.count
                }
            
            Text("Character count: \(characterCount)")
                .font(.headline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
