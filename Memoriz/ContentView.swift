//
//  ContentView.swift
//  Memoriz
//
//  Created by Chengbin Feng on 20/9/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
//    var i: Int,
//    var s: String,
    
    var body: some View {
        HStack{
            CardView(content: "👽")
            CardView(content: "🐱")
            CardView(content: "👌")
            CardView(content: "🎆")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    func foo(){
    
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool  = true
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }else{
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
