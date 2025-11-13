//
//  ContentView.swift
//  Memoriz
//
//  Created by Chengbin Feng on 20/9/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let emojis: [String] = ["👽", "🐷", "👌", "🎆", "🐶", "🐼", "🦊", "🐸", "🐵", "🐯", "🦁", "🐨", "🐷", "🐰", "🐙", "🐠", "🌵", "🍎", "🍕", "⚽️", "🚗", "✈️", "🎲", "🎵","🚀", "✈️"]
//    var i: Int,
//    var s: String,
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
          
            HStack{
      
                cardAdder
             
                Spacer()
                cardRemover
         
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 150))]){
            ForEach(0..<cardCount, id:\.self){
                index in CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
    }
    
    func cardCounterAdjuster(by offset:Int, symbol:String) ->some View{
        Button(action: {cardCount+=offset}, label: {Image(systemName: symbol)})
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View{
        cardCounterAdjuster(by: -1, symbol: "eraser")
    }
    
    var cardRemover: some View{
  
        cardCounterAdjuster(by: +1, symbol: "pencil.tip")
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
