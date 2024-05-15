//
//  ContentView.swift
//  SwiftUINaturalLanguageDemo
//
//  Created by Angelos Staboulis on 15/5/24.
//

import SwiftUI
import NaturalLanguage
struct ContentView: View {
    @State var phrase:String
    @State var language:String
    var body: some View {
        VStack {
            Text("Language Recognize")
            VStack{
                Text("Please enter a phrase").frame(width:300,height:45,alignment: .leading)
                TextField("Enter a phrase", text: $phrase).frame(width:300,height:45,alignment: .leading)
                Button(action: {
                    language = recognizeLanguage(phrase: phrase)
                }, label: {
                    Text("Language Recognize")
                })
                Text("Language").frame(width:300,height:45,alignment: .leading)
                TextField("Language", text: $language).frame(width:300,height:45,alignment: .leading)
            }.padding(30)
            Spacer()
        }
      
    }
    func recognizeLanguage(phrase:String)->String{
        let recognize = NLLanguageRecognizer()
        recognize.processString(phrase)
        if let language = recognize.dominantLanguage {
            return language.rawValue
        } else {
            return "Language not recognized"
        }

    }
}

#Preview {
    ContentView(phrase: "", language: "")
}
